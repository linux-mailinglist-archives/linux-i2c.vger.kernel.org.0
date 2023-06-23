Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7104873B4FB
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbjFWKPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjFWKPp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:15:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13E7172C
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:15:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9A966194E
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B723CC433C0;
        Fri, 23 Jun 2023 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687515321;
        bh=4i9s+qKe1rs2PAkyMGtxHbHrtahkmkd46nQ3phsqfWI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BH5jLT2ZQzglpMwwgiH+76zTwuMQBP1G8DmhgYySFDyBT6XL5laDn/N2sioQE2M6z
         cWKrVUlyOerCLZq80M2SkJf32GPIwGw0ojaQxOaU2RTRqxnvEpXojxKTEtmPTiqzvy
         O9vB9AsYQMPtoTtgxy6gPqkc62T0C13WKaNagwrj5bR1lhAg0fIU3rIWsmXDcQc2OU
         LKG+kazyX8EsZuXXPnKkBV/6yyqhAiIgoc37MutmqLJetdvN97aZxV0DsaRPlZWKSv
         HoAklg6xoFzYzw7fjv4C+7j1ZlALi+KZCj+8MVnj63ohIaaAJJyLmDWnt4Jv9vJUR/
         3QHmjm6R2IHuQ==
Date:   Fri, 23 Jun 2023 12:15:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/15] i2c: busses: jz4780: Use devm_clk_get_enabled()
Message-ID: <ZJVwtohDfAlSUpqB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-7-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lVdkKCPGTNglhF01"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-7-andi.shyti@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lVdkKCPGTNglhF01
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  static void jz4780_i2c_remove(struct platform_device *pdev)

You did not update the remove function.


--lVdkKCPGTNglhF01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVcLUACgkQFA3kzBSg
KbYFMxAAr/kklR5qXrd8wPu+ygjdyYEACMOad+N/TbsjCSnXIiH8sdQz64OiRCPG
li77f9As/sntD821yIZz/sntrNORgkRzHLARqxKickA2cuzT8iLry4Gf9NHqcQ81
9xSFR+lHXu2c067bf9urlk1BytfK0kDVNYiOY4qScM4+22z95CLIVjoNT+UrV+Ga
R9Q+rf5uIJCDwwsihMtVhisZos9jGeRDud9hBrAknAH9yxIWtYvBmFA8qUsy3ire
CX8Tat39uF7CEyk0Vr+VAPb2QapuyXka/gWla7tfe2NQQVFTodzURhHHOnpnxzc+
FR6+eQiJfXZ4jnrrHq1i4i+8yhwsCcwEiJ8XSgqExXjKzJx3RcRshMcxxDFOtAtX
s6tPkPRXvbVLHB/nDbBV9hLTzc+7NDa9nyg3LvPOVkJCHrqF8pvg+VtJnZYyVInB
FSHW5wfLyjljY2gnXeN9f4uZCLBq4iD4Y5tfBjzu5ZmF1IHwM3tE4poXIJxQK+HA
l7j+BEKgoc0EwOZMKqMFtJpPM471Uv6zfJhgR4H3afnEq13LHbAd82aKOYy91dXM
BC7xNjrMX2OmchPLoiW2pF5cBa1rz7XbWVT1OOJ01LQ6pO39M9X8Ukb1vPjQQ3lk
u4Ph+14VcWgcWp62flybskC2rihdaxTyxwmH1+HqUyU5Zjw8B7A=
=rQ4d
-----END PGP SIGNATURE-----

--lVdkKCPGTNglhF01--
