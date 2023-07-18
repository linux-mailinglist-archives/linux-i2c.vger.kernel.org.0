Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251B07572E5
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jul 2023 06:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjGREqz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jul 2023 00:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGREqy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jul 2023 00:46:54 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DC7BB;
        Mon, 17 Jul 2023 21:46:52 -0700 (PDT)
Received: from [192.168.2.126] (109-252-154-2.dynamic.spd-mgts.ru [109.252.154.2])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D0F0F66020AE;
        Tue, 18 Jul 2023 05:46:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689655610;
        bh=2U3/DuKXVaD37YXWSHso96n1NJbQ0J+Obxkz1ExT5m8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e+P3BrGO/Aps8Tg9FBk584ntwR55t3R8pCm7t5GhqmEqo1DiGtjm5PE8kuZ+eGWkx
         s34r9V2C3fX5GnAWL2/56UYHhpG61Ekp9eyuG5uAhTHKNwvJSwPzJpJO0E9Sj3wFOZ
         ArP8xd+BCbqWNwBMqH10aUt88CYyFF3/V7QnWj+c+f4PFvlv60Pf8WdMzT/OyCwdMd
         mWXKC1ihS60Ion1qjwE3WKYmfBc2ohOZLA/GBpPwgOeMiLet9TxigTs2nD4+1meRTn
         9rSa2hYbc96X7l8kM/MZpK4cbJ38fEduHzoFR4q7gucogtQ1JWEV+KnHxO0c8YkSPA
         sdRJ0F3zVjBNw==
Message-ID: <215679f1-a866-1e92-1bab-9c80918927a6@collabora.com>
Date:   Tue, 18 Jul 2023 07:46:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v7 5/5] mfd: tps6586x: register restart handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     peterz@infradead.org, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
 <20230327-tegra-pmic-reboot-v7-5-18699d5dcd76@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v7-5-18699d5dcd76@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.07.2023 10:53, Benjamin Bara пишет:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> There are a couple of boards which use a tps6586x as
> "ti,system-power-controller", e.g. the tegra20-tamonten.dtsi.
> For these, the only registered restart handler is the warm reboot via
> tegra's PMC. As the bootloader of the tegra20 requires the VDE, it must
> be ensured that VDE is enabled (which is the case after a cold reboot).
> For the "normal reboot", this is basically the case since 8f0c714ad9be.
> However, this workaround is not executed in case of an emergency restart.
> In case of an emergency restart, the system now simply hangs in the
> bootloader, as VDE is not enabled (because it is not used).
> 
> The TPS658629-Q1 provides a SOFT RST bit in the SUPPLYENE reg to request
> a (cold) reboot, which takes at least 20ms (as the data sheet states).
> This avoids the hang-up.
> 
> Tested on a TPS658640.
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Acked-for-MFD-by: Lee Jones <lee@kernel.org>

Acked-for-MFD-by isn't a valid tag, scripts/checkpatch.pl should tell
you about it.

In general you may add a comment to a tag, like this:

  Acked-by: Lee Jones <lee@kernel.org> # for MFD

In this particular case, the comment is unnecessary because Lee is the
MFD maintainer, hence his ack itself implies the MFD subsys.

-- 
Best regards,
Dmitry

