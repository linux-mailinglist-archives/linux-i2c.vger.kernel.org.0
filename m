Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACF61C8A87
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 14:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgEGMUk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 08:20:40 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:30060 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725949AbgEGMUk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 May 2020 08:20:40 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49HsxK3Pjsz5w;
        Thu,  7 May 2020 14:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1588854037; bh=6tewwqfLzrtjeC61d+9JygytIL+HVfjbhQ3OBGJvseo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DncWvkk/oEPh6aaiHJgxgUER84xvIL9SLcydXSP802b7cj01x+o5qrU0JokRAgZxY
         LUW2WdnKYopvrtlUraPFx1Llz03xZnSMiwLrmFR8VagujyXd0elPYYOXBbzpVoEzrF
         KPMZzFBqcHvBtXiMAz/wQWGDXd9tO56xB8Y3cxtmAmiRbHAY3sqZwudiErAwqlw3yp
         uKRBS9kfeQvNElXnnSHbJYLZnhe+vSWHUnlNWw075w9SCnqulwgKAC0lhaIN+XlMrY
         m26qRuuW+8hnglMCiZXJ4cmd5c9G0eKrC8kZgEdNDXdnYn8O2OLI/UmRMCrVNPd/gI
         nmQk58JDsRITQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Thu, 7 May 2020 14:20:35 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Message-ID: <20200507122035.GA5408@qmqm.qmqm.pl>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <20200506224336.GA23423@qmqm.qmqm.pl>
 <20200507100315.GA2890327@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200507100315.GA2890327@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 07, 2020 at 12:03:15PM +0200, Thierry Reding wrote:
> On Thu, May 07, 2020 at 12:43:36AM +0200, mirq-test@rere.qmqm.pl wrote:
> > On Wed, May 06, 2020 at 09:33:55PM +0200, Thierry Reding wrote:
> > [...]
> > > --- a/drivers/i2c/busses/i2c-tegra.c
> > > +++ b/drivers/i2c/busses/i2c-tegra.c
> > > @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
> > >  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
> > >  {
> > >  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> > > +	int err = 0;
> > >  
> > >  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> > >  
> > > -	return 0;
> > > +	if (!pm_runtime_status_suspended(dev))
> > > +		err = tegra_i2c_runtime_suspend(dev);
> > > +
> > > +	return err;
> > >  }
> > >  
> > >  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> > > @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
> > >  	if (err)
> > >  		return err;
> > >  
> > > -	err = tegra_i2c_runtime_suspend(dev);
> > > -	if (err)
> > > -		return err;
> > > +	if (pm_runtime_status_suspended(dev)) {
> > [...]
> > Shouldn't this be negated as in suspend? I would assume that inbetween
> > suspend and resume nothing changes the stored state.
> 
> I know this is confusing because I have now twice had the same doubts
> after looking at the patch after I sent it out and thought I had sent
> out a wrong version.
> 
> However, I think it starts to make more sense when you look at the
> resulting code, which I'll reproduce below:
> 
> 	static int __maybe_unused tegra_i2c_resume(struct device *dev)
> 	{
> 		struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> 		int err;
> 
> 		err = tegra_i2c_runtime_resume(dev);
> 		if (err)
> 			return err;
> 
> 		err = tegra_i2c_init(i2c_dev, false);
> 		if (err)
> 			return err;
> 
> 		if (pm_runtime_status_suspended(dev)) {
> 			err = tegra_i2c_runtime_suspend(dev);
> 			if (err)
> 				return err;
> 		}
> 
> 		i2c_mark_adapter_resumed(&i2c_dev->adapter);
> 
> 		return 0;
> 	}
> 
> So the purpose here is to runtime resume the I2C controller temporarily
> so that the register context can be reprogrammed because it was lost
> during suspend. Now, if the controller was runtime suspended prior to
> system suspend, we want to put it back into suspend after the context
> was loaded again. Conversely, if it was not runtime suspended, then we
> want to keep it on.
> 
> If it helps I can sprinkle some comments throughout this function to try
> and explain why exactly this is being done.

Now it makes sense. Thanks!

The full function is the missing context. What you wrote here 
put in commit message should also do the job.

Best Regards,
Micha³ Miros³aw
