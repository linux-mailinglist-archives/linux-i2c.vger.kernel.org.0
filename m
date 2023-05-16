Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8E2704C25
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 13:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbjEPLS0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 07:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbjEPLSV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 07:18:21 -0400
X-Greylist: delayed 1097 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 May 2023 04:18:00 PDT
Received: from esg.nwe.de (esg.nwe.de [195.226.126.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256EB173D
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 04:17:59 -0700 (PDT)
X-ASG-Debug-ID: 1684234776-1ed71d5dc8290870001-PT6Irj
Received: from mail.scram.de ([213.206.175.31]) by esg.nwe.de with ESMTP id frkCTtbL0QAy9LA8; Tue, 16 May 2023 12:59:36 +0200 (CEST)
X-Barracuda-Envelope-From: jochen@scram.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.206.175.31]
X-Barracuda-Apparent-Source-IP: 213.206.175.31
Received: (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender)
        by mail.scram.de (Postfix) with ESMTPSA id CCEDA8A7031;
        Tue, 16 May 2023 12:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.scram.de CCEDA8A7031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scram.de;
        s=mail2021; t=1684234776;
        bh=nEo2mLFdd15nlmRH/p5msdgFUoZwDBU31/nzpMEUECM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DUruOuiDQO2rHQwV4lnHT+BIHxgU40QJqIoFcHvKIkr7bFS9hVWIP5LPKQ9YlkE1W
         LI3CRvU4SdlNpiFochhA8cV8AEZExFLAGMZlhUdleIF4XpApKTmFHtgxW06hITm2Ti
         dxAjFpfmuBW17h/A6OkFznX65cORMAvnR3ZiFInc=
Message-ID: <8c9fcf47-8d4e-b668-c52c-240a5ed4cc60@scram.de>
Date:   Tue, 16 May 2023 12:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/89] i2c: cpm: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH 14/89] i2c: cpm: Convert to platform remove callback
 returning void
Cc:     linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-15-u.kleine-koenig@pengutronix.de>
From:   Jochen Friedrich <jochen@scram.de>
In-Reply-To: <20230508205306.1474415-15-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Barracuda-Connect: UNKNOWN[213.206.175.31]
X-Barracuda-Start-Time: 1684234776
X-Barracuda-URL: https://195.226.126.84:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at nwe.de
X-Barracuda-Scan-Msg-Size: 1894
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=5.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.108840
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Acked-by: Jochen Friedrich <jochen@scram.de>

Am 08.05.2023 um 22:51 schrieb Uwe Kleine-König:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/i2c/busses/i2c-cpm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 24d584a1c9a7..732daf6a932b 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -676,7 +676,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
>   	return result;
>   }
>   
> -static int cpm_i2c_remove(struct platform_device *ofdev)
> +static void cpm_i2c_remove(struct platform_device *ofdev)
>   {
>   	struct cpm_i2c *cpm = platform_get_drvdata(ofdev);
>   
> @@ -685,8 +685,6 @@ static int cpm_i2c_remove(struct platform_device *ofdev)
>   	cpm_i2c_shutdown(cpm);
>   
>   	kfree(cpm);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id cpm_i2c_match[] = {
> @@ -703,7 +701,7 @@ MODULE_DEVICE_TABLE(of, cpm_i2c_match);
>   
>   static struct platform_driver cpm_i2c_driver = {
>   	.probe		= cpm_i2c_probe,
> -	.remove		= cpm_i2c_remove,
> +	.remove_new	= cpm_i2c_remove,
>   	.driver = {
>   		.name = "fsl-i2c-cpm",
>   		.of_match_table = cpm_i2c_match,
