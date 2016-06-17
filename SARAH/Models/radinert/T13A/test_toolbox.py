MODEL='radinert' 
import os.path
import commands
def test_micromegas():
    assert os.path.isfile('../../../SPHENO/bin/SPheno%s' %MODEL), 'run ./butler %s first' %MODEL
    a=commands.getoutput('../../../SPHENO/bin/SPheno%s LesHouches.in.%s_low' %(MODEL,MODEL))
    assert os.path.isfile('SPheno.spc.%s' %MODEL)
    a=commands.getoutput('../../../micromegas/%s/CalcOmega SPheno.spc.%s' %(MODEL,MODEL))
    assert eval(a.split('\n')[-1].split('%')[0])==2, 'micrOMEGAS failed'
    
if __name__=='__main__':
    test_micromegas()
