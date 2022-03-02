Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1384CAEE3
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 20:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241860AbiCBTnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 14:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241978AbiCBTm5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 14:42:57 -0500
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr [80.12.242.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909FFD761A
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 11:42:12 -0800 (PST)
Received: from [192.168.1.18] ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id PUrQnnTCySrXTPUrRnhqIB; Wed, 02 Mar 2022 20:42:09 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 02 Mar 2022 20:42:09 +0100
X-ME-IP: 90.126.236.122
Message-ID: <e0dc7291-b1a3-0cd2-32c9-d3486e591c5f@wanadoo.fr>
Date:   Wed, 2 Mar 2022 20:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: *** SPAM *** [PATCH] i2c: mux: demux-pinctrl: do not deactivate a
 master that is not active
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Le 02/03/2022 à 12:22, Peter Rosin a écrit :
> Attempting to rollback the activation of the current master when
> the current master has not been activated is bad. priv->cur_chan
> and priv->cur_adap are both still zeroed out and the rollback
> may result in attempts to revert an of changeset that has not been
> applied and do result in calls to both del and put the zeroed out
> i2c_adapter. Maybe it crashes, or whatever, but it's bad in any
> case.
>
> Fixes: e9d1a0a41d44 ("i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pinctrl_probe()'")
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>   drivers/i2c/muxes/i2c-demux-pinctrl.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> Hi!
>
> Either that, or I'm missing something. I found this issue when
> reading code, and have made no tests to verify if my analysis
> is correct.
>
> Cheers,
> Peter
>
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index 5365199a31f4..f7a7405d4350 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -261,7 +261,7 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
>   
>   	err = device_create_file(&pdev->dev, &dev_attr_available_masters);
>   	if (err)
> -		goto err_rollback;
> +		goto err_rollback_activation;
>   
>   	err = device_create_file(&pdev->dev, &dev_attr_current_master);
>   	if (err)
> @@ -271,8 +271,9 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
>   
>   err_rollback_available:
>   	device_remove_file(&pdev->dev, &dev_attr_available_masters);
> -err_rollback:
> +err_rollback_activation:
>   	i2c_demux_deactivate_master(priv);
> +err_rollback:
>   	for (j = 0; j < i; j++) {
>   		of_node_put(priv->chan[j].parent_np);
>   		of_changeset_destroy(&priv->chan[j].chgset);

For what it worth, LGTM.

CJ

