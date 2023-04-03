Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829346D4C3B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 17:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjDCPoX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 11:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbjDCPoX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 11:44:23 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEBDE8;
        Mon,  3 Apr 2023 08:44:22 -0700 (PDT)
Received: from [192.168.2.163] (109-252-124-32.nat.spd-mgts.ru [109.252.124.32])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A99E6660312D;
        Mon,  3 Apr 2023 16:44:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680536660;
        bh=h906dX4/iwoBMkK5p++Mkpnuq0YPw75gIWeGHov8PcE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=f7h6y51iyU9x9BJVmQM570DlR1t+AbYsIjlhM/UUKIHEkjwhG6wOnhYpyWYzfDfbx
         LswAR3pQN1VypwRg1NAyjrKw1dsJfFhbxUqNQGsdbKHImnrsFoF8GBj9a4ze1xjzf+
         ikn/6tGwqYgt4wo0ezuYyD5qJcAcJ/vH8+nBkR/CblyBav3CqdshxpKe9aMZE9VkmI
         X1rnTyVohHNlEKXfBPKvYgF4i7WqDddJCvTD1mpOcSwDopAt2C66uyMnmPrW3nje0c
         20tLWPEaOhzwHskP5QBbGgGhgxiIABeljiPrwu0xg4nG9Kg/aH+xqJLbC09Ys9uomg
         mR/H5SFIh8a4g==
Message-ID: <ab4d8e1e-d378-85d2-34aa-404ff178c49f@collabora.com>
Date:   Mon, 3 Apr 2023 18:44:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] mfd: tps6586x: register restart handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     benjamin.bara@skidata.com, jonathanh@nvidia.com, lee@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, treding@nvidia.com, wsa@kernel.org
References: <6abaa803-1639-b949-3af5-05a341f9b459@collabora.com>
 <20230403065013.520339-1-bbara93@gmail.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230403065013.520339-1-bbara93@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SORTED_RECIPS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/3/23 09:50, Benjamin Bara wrote:
> Thanks for the feedback!
> 
> The DS states: "When the reboot request state is set an internal timer TWAIT
> (10ms typ) is started. The reboot request ends when t > TWAIT."
> 
> Therefore, my intention was to wait a little bit before starting the next
> handler in the chain. I can do some tests without the mdelay, but otherwise
> will reduce it to 15ms in the next patch. What do you think about it?

Sounds good. Please add a clarifying comment for the delay to the code.

-- 
Best regards,
Dmitry

