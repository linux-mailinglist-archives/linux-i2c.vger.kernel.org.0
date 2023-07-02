Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B66F744D4F
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jul 2023 12:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjGBKkM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jul 2023 06:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjGBKkL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Jul 2023 06:40:11 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6984E54;
        Sun,  2 Jul 2023 03:40:09 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Qv5D72bvpz56;
        Sun,  2 Jul 2023 12:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1688294407; bh=Vt2OuD2YgoWjYb9mB0pJty47mCq/a7jrF/gXYo2tnkw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pvHYkXhaHjIchq0Yun+6ber7npZhKtrjaVMrDvWHA9Jp2YzB9Z6G/w0Kzt45ovPpF
         ge58y/gZeUu49F+HhLpIZQWXpTv8RFiip2OmSehiATfoIHQaqnAWfx6qbYdtOlzFPK
         8zKNzo6okTLvzCUCv1y/H9ZhKZOo51f5/Wlhi3bep0shZrsrPMFGGNT4nVBTL9mDcT
         /7LrHGuhptDWK84OjIa93hRQd35vzlS3f4NtBKUGTGR9prsSgcKLfVLVHH7AZeA+/8
         iFxi8sU4f+mPHmBofuX+RICpYIoTkD3cOmUj49IuPlpnodwshsitZaVLDl/tnsxZXr
         NAyq9gpoYIz/g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Sun, 2 Jul 2023 12:40:05 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: at91: constify at91_twi_pdata
Message-ID: <ZKFUBUyCqZBNUMfz@qmqm.qmqm.pl>
References: <6ac87dcbb660ae892bf8740c78d3eca7625d6db6.1687814664.git.mirq-linux@rere.qmqm.pl>
 <20230629223825.27q75s2a3eyiapgy@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230629223825.27q75s2a3eyiapgy@intel.intel>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 30, 2023 at 12:38:25AM +0200, Andi Shyti wrote:
> Hi Michal,
> 
> [...]
> 
> > -static struct at91_twi_pdata *at91_twi_get_driver_data(
> > +static const struct at91_twi_pdata *at91_twi_get_driver_data(
> >  					struct platform_device *pdev)
> >  {
> >  	if (pdev->dev.of_node) {
> > @@ -189,9 +189,9 @@ static struct at91_twi_pdata *at91_twi_get_driver_data(
> >  		match = of_match_node(atmel_twi_dt_ids, pdev->dev.of_node);
> >  		if (!match)
> >  			return NULL;
> > -		return (struct at91_twi_pdata *)match->data;
> > +		return match->data;
> >  	}
> > -	return (struct at91_twi_pdata *) platform_get_device_id(pdev)->driver_data;
> > +	return (const void *) platform_get_device_id(pdev)->driver_data;
> 
> the const's always confuse me... do you get an error here? Is
> this cast really needed?

platform_device_id.driver_data is an ulong, not a void pointer. So, the
cast is needed. It could be just (void *), but I think it's better to
document the constness in the code.

-- 
Micha³ Miros³aw
