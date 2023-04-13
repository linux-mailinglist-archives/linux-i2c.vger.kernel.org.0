Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632156E0F73
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 16:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjDMOAB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 10:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbjDMOAA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 10:00:00 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D32B463;
        Thu, 13 Apr 2023 06:59:35 -0700 (PDT)
Received: from [192.168.2.90] (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D90DB660321A;
        Thu, 13 Apr 2023 14:59:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681394374;
        bh=KI9YBaRt8ASIsye9tPXU0vjnJoJMseoh4hyAWR6zhE8=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=dUwpNxz24XFCK16wl6jtcEmAY6QkzNOjA5FdwL/7l4ArWcq+npmxK/x0ePoy/WI1E
         TWM5rQF6XVsnZwVcztdMdm2Vj15GJW68EGuCugDt15dr7PczHpEX5c0GbdCBsagaGk
         D7I67EvjPkTKsv4gagdMwiolw2m8Y5knwGQCOdEIxqadcL6MTzEGJSUNJi3UJVrR9t
         D1iV41n21ssny6ccvrYL5bwQWQC1i5Zon4HFpKNHKmHrox+awA1YN9NrZFr1e1k4eA
         Po3KrZKn9seymBVNDR1a3prAoOHnGnZQoEaK7T3qKaDXlxLtIYYXuc8zqAj3zPKvsi
         KFIcUnyvtx4CQ==
Message-ID: <5492c5cc-c93a-fde3-cd77-a598b2b67af5@collabora.com>
Date:   Thu, 13 Apr 2023 16:59:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 1/2] i2c: tegra: Fix PEC support for SMBUS block read
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, wsa@kernel.org
References: <20230413130849.2894-1-akhilrajeev@nvidia.com>
 <20230413130849.2894-2-akhilrajeev@nvidia.com>
Content-Language: en-US
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230413130849.2894-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/13/23 16:08, Akhil R wrote:
> @@ -279,6 +280,7 @@ struct tegra_i2c_dev {
>  	size_t msg_buf_remaining;
>  	int msg_err;
>  	u8 *msg_buf;
> +	__u16 msg_len;

It's still __u16

-- 
Best regards,
Dmitry

