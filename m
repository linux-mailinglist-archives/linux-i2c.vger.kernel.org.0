Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C1F6BD922
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbjCPT2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjCPT2k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:28:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9463ED50D
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 12:28:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E103B8228E
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 19:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74185C433D2;
        Thu, 16 Mar 2023 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678994915;
        bh=90ovp0L5CtkB8w9bTg/6/Ldko1l3bV/o452zgS8jCnM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k5RMXACy0KzmvJQk/7rIg7HFz/pL8rx5TSilBaWDkUDWi6W1QOA3ZzvgpL1mPOdry
         rKRSP9LbKz/pLIDaTPrZ3UAWuVYQVJXIbPjND5XSnoLW2Ckbm8bzdVprcXKrwobw0G
         TaQAETVmBicki2B1j8WH7/XdQljkifmiPlrcZ25Iif0n9h1iEUnXAErFfEf3/U4DmI
         wRfEPAAJ3j1AOJpHaT9Mkax81MJnukZtjoLAqkQV3ZhEMQQy5TIAPwQ28vjBT5Xhq2
         xunx2AwZZY07GANORM00z6rRoXiEvYRIUumlGQcIRg4v2jsIZTBx5FRAOAatEnWjHc
         D11ltBgzf763A==
Date:   Thu, 16 Mar 2023 20:28:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Michal Simek <michal.simek@amd.com>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: cadence: Remove unnecessary register reads
Message-ID: <ZBNt4PXvmuJbsjtZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-6-lars@metafoo.de>
 <1086bd44-fc57-8a68-a418-1154828729b2@amd.com>
 <7fc8ed1d-c28d-1c0b-bce7-de75872f4ea2@metafoo.de>
 <59b09614-a4c7-837c-61fd-22db0b13fa67@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IBrjSPYHi0KtaRYm"
Content-Disposition: inline
In-Reply-To: <59b09614-a4c7-837c-61fd-22db0b13fa67@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IBrjSPYHi0KtaRYm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Mani has tested it and he can't see any issue that's why I am fine both ways.

I read this as an ack.


--IBrjSPYHi0KtaRYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTbeAACgkQFA3kzBSg
KbaMUhAAlRfdXlPmOsaRHKUybBVZ+CCvgHq4OxwGTt3hVNWqlxJwTG+/wyzvKiyE
xXQTJCbrAmOPl6ocOwKNXClIHh36VK/wawfRF3p54bIRF+jWgEt4T7omr1BmpK/O
jzxJwa3Y25xgDT/1nsx3TMU9DvxmwdGTqTWOr0hz4bXV4wz/4QpzCIdNcUT9H2DS
tTeiG0xC9bNXzX5S+Qj2tOq6F9oKHYBJ+H7AgZmoceO+RKhlpuUZSmH+iu9gAT6i
zU20o/G6AXP+mSmHfTSv47SedTWRrqGYikSpoyjP/x8JyVNkrBYTWoj7fjbNs4Yk
kJkYUBd+vG8i6eYLZYJA7GEduwsg7NsdIbaYW6mwATsfzUuj4/El7Jy6sSL7jf69
9znQK8TbMYvOQYN4Wtgx6CcWtVdwPfI5k9wROCfh+dJm0lwRWH+DE74TB7o8n0t7
DeGgKs4MAm1i20n5m5z8xMNYCRxzPMgTQg0RZGQHbokV8qsa+JsYkGqIfvPgUHz+
1xDX8hIhv0VQqI5H22hejQlhUY83eALiawccQjtfBMbccavhxacQb2Pz8AWVa9N8
CHHSeu52xIKSH9/9K0DvZxB0IXiV1osouf1uEnPSNhLrU13QKu6tm2Z0A+Q8gONc
U2joGCBO3W2p2Biv6PrwfXnwUolNF9DYTbmF+vVtzIiiQkB3Rj8=
=rS2F
-----END PGP SIGNATURE-----

--IBrjSPYHi0KtaRYm--
