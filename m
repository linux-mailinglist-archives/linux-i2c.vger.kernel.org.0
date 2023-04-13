Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7966E15F7
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 22:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjDMUhK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 16:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDMUhK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 16:37:10 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE224EDE;
        Thu, 13 Apr 2023 13:37:06 -0700 (PDT)
Received: from [192.168.2.90] (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C865660321C;
        Thu, 13 Apr 2023 21:37:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681418224;
        bh=JYou/upPsTWTi2mO280E/Fj7pMcfP3hcdjqr6bkXksg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kmYPb5E77nAg+/FHO4VVWar0Dy0Kh8V/cOreEgC+SvI9k8nlkPj8uDq0c7vWhvf4o
         i4AVdGEkxBWj17e9JLmJSZJOOfiGrvspDo83iRx+jqmHNo6eh8cxBevfcsH95nZlHh
         ZllYQkWyIyZkwe4Hz4QWlPfTCiDLnVSfjuNrsd4Wa3Yavz3AqsULPsvjQfchBGsd3R
         EDVNpjPj6fKnv7qSdUqDKdQHxgHCUpxpglOBxyOtBBtupjlKs3I0qKEXK9Z5x3ybpO
         EAPjrcyPorP2Ce7KANEowPx5kiB/OJ0K3aXdYYIDClmvAUA0iNxZ0PWYIXA8nZXdiQ
         95yGQRGjtdeZw==
Message-ID: <2df6f002-dcf8-1073-d0b5-a9843103096a@collabora.com>
Date:   Thu, 13 Apr 2023 23:36:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 3/4] mfd: tps6586x: use devm-based power off handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com
Cc:     peterz@infradead.org, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v4-0-b24af219fb47@skidata.com>
 <20230327-tegra-pmic-reboot-v4-3-b24af219fb47@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v4-3-b24af219fb47@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/13/23 10:46, Benjamin Bara wrote:
> +static int tps6586x_power_off_handler(struct sys_off_data *data)
>  {
> -	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
> -		return;
> +	struct device *tps6586x_dev = data->cb_data;
> +	int ret;
> +
> +	ret = tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT);
> +	if (ret)
> +		return ret;
>  
> -	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
> +	return tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);

Handlers must return NOTIFY_DONE or notifier_from_errno(). Sorry for
missing this previously.

-- 
Best regards,
Dmitry

