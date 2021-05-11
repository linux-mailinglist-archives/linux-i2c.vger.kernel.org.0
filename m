Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604D437A73B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 14:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhEKM7f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 08:59:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61892 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhEKM7f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 08:59:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620737909; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lYaVpUKqUhk7AZILQOBcBVn1o1hxlbG/qfA0IIbmC/o=;
 b=WzaF7Qqm3+Pu+VYMtCB9GAaOep394k00I9Qh2EMe7UyNgU0R9LTYkqA+q4M28Hbk8rQMCLf7
 4VJlIOEDNLzGYQA/IvzWJ8hRbO7msDXXq5gqDSR/vbDyHcIS8cUkcsYEbueEhLh3HOzsqESs
 /t5LcOwvCr+wy11avZV0FCL9Q74=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 609a7f6de0211609c436956c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 12:58:21
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C3D6C43145; Tue, 11 May 2021 12:58:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EE92C4338A;
        Tue, 11 May 2021 12:58:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 May 2021 18:28:19 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V9] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <CAE-0n51MEJ_+7QKpBKenjjB+rwdGN-=vxx=4oo8_-P=_yJe+jQ@mail.gmail.com>
References: <d23263dcb0f1535275ff37524b0203b2@codeaurora.org>
 <CAE-0n51YQf=NZxnw9+FLU=PSG8di7Ztp5pP03JdLXgEWGM0AZg@mail.gmail.com>
 <CAE-0n51MEJ_+7QKpBKenjjB+rwdGN-=vxx=4oo8_-P=_yJe+jQ@mail.gmail.com>
Message-ID: <84d603d86a74efeb78b78f5812d3921c@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-05-08 13:26, Stephen Boyd wrote:
> Quoting Stephen Boyd (2021-05-07 13:09:21)
>> Quoting rojay@codeaurora.org (2021-05-07 03:07:42)
>> > On 2021-05-05 07:08, Stephen Boyd wrote:
>> > > Quoting Roja Rani Yarubandi (2021-04-20 04:13:55)
>> >
>> > > In fact, where is that code? I'd expect to see i2c_del_adapter() in
>> > > here
>> > > so we know the adapter can't accept transfers anymore. Maybe
>> > > i2c_del_adapter() could be called, and then there's nothing to do after
>> > > that? This whole patch is trying to rip the adapter out from under the
>> > > i2c core framework, when we should take the opposite approach and
>> > > remove
>> > > it from the core framework so that it can't transfer anything anymore
>> > > and thus the IOMMU can remove the mapping.
>> > >
>> >
>> > IIUC about probe/remove/shutdown calls, during "remove" we will unplug
>> > the
>> > device with opposite calls to "probe's" plug operations.
>> > For example i2c_add_adapter() from 'probe' and i2c_del_adapter() from
>> > 'remove'.
>> > For "shutdown", as system is going to shutdown, there is no need of
>> > unplug
>> > operations to be done.
>> >
>> > And also, I had a glance on other upstream i2c drivers, and noticed
>> > "i2c-i801.c"
>> > driver has i2c_del_adapter() called from remove callback but not from
>> > shutdown
>> > callback.
>> 
>> Sure, other drivers could also be broken.
> 
> What does it have in the shutdown callback? I see that it is wrong to
> delete the adapter in shutdown because this problem happens. First
> shutdown is called for various i2c clients, then shutdown is called for
> the adapter. If the adapter shutdown calls i2c_del_adapter(), then
> remove is called for the various i2c clients. The i2c clients aren't
> expecting this and start doing double frees and stuff. It's really 
> quite
> a mess. I suspect i2c shutdown should probably block remove from being
> called on it entirely. Either way, it's the wrong approach.
> 
> Instead, I think we should merely suspend the i2c bus like this. Then 
> we
> can hunt down the various drivers that try to access the bus after the
> i2c bus has been removed. I've already done that for rt5682 (see the
> patch link later).
> 

Ok. I will proceed with the current approach only then
(not calling i2c_del_adapter() in shutdown). I will post the
patch with the other comments answered.

> ----8<---
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c
> b/drivers/i2c/busses/i2c-qcom-geni.c
> index 20216e382b4c..af3ed808ba2e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -655,6 +655,14 @@ static int geni_i2c_remove(struct platform_device 
> *pdev)
>  	return 0;
>  }
> 
> +static void geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
> +
> +	/* Make client i2c transfers start failing */
> +	i2c_mark_adapter_suspended(&gi2c->adap);
> +}
> +
>  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  {
>  	int ret;
> @@ -719,6 +727,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
>  static struct platform_driver geni_i2c_driver = {
>  	.probe  = geni_i2c_probe,
>  	.remove = geni_i2c_remove,
> +	.shutdown = geni_i2c_shutdown,
>  	.driver = {
>  		.name = "geni_i2c",
>  		.pm = &geni_i2c_pm_ops,
> 
>> 
>> >
>> > And actually I tried calling i2c_del_adapter() from geni_i2c_shutdown(),
>> > and it resulted in below WARNING trace
>> > [   90.320282] Call trace:
>> > [   90.322807]  _regulator_put+0xc4/0xcc
>> > [   90.326583]  regulator_bulk_free+0x48/0x6c
>> > [   90.330808]  devm_regulator_bulk_release+0x20/0x2c
>> > [   90.335744]  release_nodes+0x1d0/0x244
>> > [   90.339609]  devres_release_all+0x3c/0x54
>> > [   90.343735]  device_release_driver_internal+0x108/0x194
>> > [   90.349109]  device_release_driver+0x24/0x30
>> > [   90.353510]  bus_remove_device+0xd0/0xf4
>> > [   90.357548]  device_del+0x1a8/0x2f8
>> > [   90.361143]  device_unregister+0x1c/0x34
>> > [   90.365181]  __unregister_client+0x78/0x88
>> > [   90.369397]  device_for_each_child+0x64/0xb4
>> > [   90.373797]  i2c_del_adapter+0xf0/0x1d4
>> > [   90.377745]  geni_i2c_shutdown+0x9c/0xc0
>> > [   90.381783]  platform_drv_shutdown+0x28/0x34
>> > [   90.386182]  device_shutdown+0x148/0x1f0
>> >
>> > Can you please suggest me what might be missing here?
>> >
>> 
>> It looks like some device that is on the i2c bus is putting a 
>> regulator
>> in the remove path without disabling it. Can you print out which 
>> device
>> driver it is and fix that driver to call regulator_disable() on the
>> driver remove path? I'll try locally and see if I can find the driver
>> too.
> 
> I see that it's the rt5682 driver. I sent
> https://lore.kernel.org/r/20210508075151.1626903-2-swboyd@chromium.org
> for this in case you want to look, but it won't be necessary.
