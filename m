Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0950C54A01E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 22:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346839AbiFMUs7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 16:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348989AbiFMUsV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 16:48:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD921038;
        Mon, 13 Jun 2022 13:06:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 142FC61571;
        Mon, 13 Jun 2022 20:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B61C34114;
        Mon, 13 Jun 2022 20:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655150772;
        bh=shKSr/RiV2YcabImw7K3ffFlzf7xs/cPOaAF6/t5ZCY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H6L7u8jMeuHogNoG/VW04jHZnGwXKCZBPaTJGxSSqpB0MMqThvHKRUfAgUAse7XMi
         Fq9RKmJsGedh9kVH4+rJBcqEKiGRR+Fe/JTZIWXbpG8slKGaFz4kPODA8XySEx/67p
         n+0uVqzRAMWG9d4fFJqZA4fGynEycyzh2VFZBrkYZvWf4BgPHVCxm0NKCmOvEXMOlt
         YcWcJZDR21nkVN1hJdZHNDAUXXpx4sUkMRraL62CEKWXw7PIoK7BL9bxlwjO1/QwN4
         EkynUGfbS3HuQDo8J0t9AE175CXIA13cUq3ChEUnymiyQDH96C3SjpWgo+FlzTJ+P3
         o/XGffJtFCgXA==
Date:   Mon, 13 Jun 2022 22:06:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Codrin.Ciubotariu@microchip.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ludovic.Desroches@microchip.com,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, kamel.bouhara@bootlin.com
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Message-ID: <YqeYr6b2k0rXsvIv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Peter Rosin <peda@axentia.se>, Codrin.Ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        kamel.bouhara@bootlin.com
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <YqdQoJbsgwjQ9PYh@shikoro>
 <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ogV34CoYxK6HOSzb"
Content-Disposition: inline
In-Reply-To: <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ogV34CoYxK6HOSzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I replied to patch 1/3 and 2/3 but have not seen them on the lists and
> patchwork also appears to be in the dark.
> Did the replies make it anywhere? Should I resend?

I didn't get them. Yeah, maybe a resend will help?


--ogV34CoYxK6HOSzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKnmK8ACgkQFA3kzBSg
KbbJWBAAlS8SaQDw0SsR0R3wckRC2LN0TZ1ehFWsm9akX38NgWXfprCt5Y1HcKsu
DcyHwWdwVKoT6lCPkAKeZsfF+3ipoKBf4CedKk5zYwL/3o/I80S3+sYSw+akUV05
X3HWMjpCRlWAqGRod4TWafawWqEA1U4GlDmApYl3TB7PWEk27lJp+3BgwBgnSs0l
9dT7CnfeqkeIVZ8LapGQksqwC/fKMsa4dVNyluCDHHm9DlsDHFgW4fYzWJgg8WlS
rhTC2QnXYmcRS0uWQR7W+FNnHjRK2ARyP+So2rzbes7/tqBBMAMWlvMzpNHd3ucb
ZkQWVxRs4cXcpprtyuhA0axvAGfYCc4lvGr8IdRoFyPnDSv8U3hUZ4ZU2bH8C//2
CbyRTFGBu7C1UV5YwjswBkAmvUeFrnM6gSH+/ZcZcOQlQ23RHG4TFMCe93MPJPv4
RbKLzX/WhBnzY+b7Vk0Y+lGgM1QX5CsEiL8S82dpxhylypGXv9GX8d0F2sXP/lXT
hNJ0BqA1Tp7umUUom7ZTM0h8IZnEWn8k0RRr7XMTvKQOA4cIhVccBHRCJHIrfMm0
qsJp7dJpm6nuCfipS3yW1UXZjhq1NRKRNLQrt+aQPwYZVHvdPBq9di6uqmQdOnHg
7gB1dExjEtarnUpcMfsABDJ/jz1nL0fZRZLKPoM6HGiisxfQKD8=
=Rl7P
-----END PGP SIGNATURE-----

--ogV34CoYxK6HOSzb--
