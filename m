Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E221746465
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 22:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjGCUqG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 16:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGCUqG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 16:46:06 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9756E5D;
        Mon,  3 Jul 2023 13:46:04 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Qvycp21TJz1H;
        Mon,  3 Jul 2023 22:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1688417162; bh=eq9u59RQzb8F9bjvntLYZLDUQwd0OvoA6sjsDy1QVSo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AmZdEtj7Ly56s5YwEQnwr43BABYQmbOjF4ksgNqNY+AsavOmRHrzqutIZyBXZyfls
         r3DQam7UwcEKFr77PcDPU9dRCPyQL+fS//Av5W1RE3eJ/qsTCcYbGSr0+xn5EKER7I
         reoClTKmTtmMkg1WXId78i0DdwspzPpbCgbMyVpsprsqwwBWCnA4sVmLsTQgdiv6cG
         plESPWWYXYHrYQCuvnNTiOjPJRAoKeQP6Ul0dxZPMwjw9VGAPSulEi3Vwp1bKtk2+t
         N5xWjpe3V6lyTfygyP981/+cNIPx6FVy6AVvIbRis6F+TFwOr0zbngdpOOo7LVqr3o
         YWAF6BtNJNcUw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Mon, 3 Jul 2023 22:46:01 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: at91: constify at91_twi_pdata
Message-ID: <ZKMziYjjHzuRIU2I@qmqm.qmqm.pl>
References: <6ac87dcbb660ae892bf8740c78d3eca7625d6db6.1687814664.git.mirq-linux@rere.qmqm.pl>
 <20230629223825.27q75s2a3eyiapgy@intel.intel>
 <19b2d721-06a3-bc17-eb81-18ee2d8856a3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19b2d721-06a3-bc17-eb81-18ee2d8856a3@kernel.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 03, 2023 at 08:23:30PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2023 00:38, Andi Shyti wrote:
> > Hi Michal,
> >> -static struct at91_twi_pdata *at91_twi_get_driver_data(
> >> +static const struct at91_twi_pdata *at91_twi_get_driver_data(
> >>  					struct platform_device *pdev)
> >>  {
> >>  	if (pdev->dev.of_node) {
> >> @@ -189,9 +189,9 @@ static struct at91_twi_pdata *at91_twi_get_driver_data(
> >>  		match = of_match_node(atmel_twi_dt_ids, pdev->dev.of_node);
> >>  		if (!match)
> >>  			return NULL;
> >> -		return (struct at91_twi_pdata *)match->data;
> >> +		return match->data;
> >>  	}
> >> -	return (struct at91_twi_pdata *) platform_get_device_id(pdev)->driver_data;
> >> +	return (const void *) platform_get_device_id(pdev)->driver_data;
> > 
> > the const's always confuse me... do you get an error here? Is
> > this cast really needed?
> 
> I think this change is not necessary and actually should not matter. See
> for example drivers/tty/serial/samsung_tty.c after my refactorings in
> commit 3aec40096550 ("tty: serial: samsung: reduce number of casts").

I added this two fragments to avoid having suggesting that the pdata might
not be in a read-only segment.  For the compiler it doesn't matter -- the
pointer is cast to const on return.

Best Regards
Micha³ Miros³aw
