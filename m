Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B47E69B4E4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBQVlc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBQVlb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:41:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F239160F8B
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 13:41:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82EB7B82D9A
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 21:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A3AC433D2;
        Fri, 17 Feb 2023 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670088;
        bh=JNMilZGyW/6h+9HWYzeoWY5htGJEMkShvO+4uLTYJsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RCDTLlkfLHqv1POv5KzYgc8S0BUBtHFoovAq0j8Ek/2XUl9vDAvFt517MPLomU3NW
         br66x3YVujbax5i1Z5kzXwYamfZn7uP+mLOMr/Im83xk/MsLT7mpT5XGwPHTCoTryL
         917stLG+Kx+VhXauKKW9pjkRL8vZd0ouErmUXYnH13UdmCRxlozc2k/am+460VoAjD
         eDz2MqkQ80NJnkOrodMBOn7WN4B8R31NRAbSNI6rJgjbqpQvxespOoPa6du7KWRdvz
         0ntWR8d8Lrz+z+xzU6KOsuGu3pAe3dfNb2rwAEaBE3mupb1ZSrz9tAPUTu+MgZk76V
         E03aOitEFOloQ==
Date:   Fri, 17 Feb 2023 22:41:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 5/6] i2c: i801: Call i801_check_pre() from
 i801_access()
Message-ID: <Y+/0hOmObotN9Nvu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20230216170830.206f0bb9@endymion.delvare>
 <20230216171451.2e87b061@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ImtqRv6FePDydU+E"
Content-Disposition: inline
In-Reply-To: <20230216171451.2e87b061@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ImtqRv6FePDydU+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 05:14:51PM +0100, Jean Delvare wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> This avoids code duplication, in a next step we'll call
> i801_check_post() from i801_transaction() as well.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--ImtqRv6FePDydU+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9IQACgkQFA3kzBSg
KbaGFw//esv9txVytKfwe4JohDeB0602Mh8gZvwc44f1wYlF5PAE1W86maxwOBID
g+UvEmqE5fCs7H6hKLMTxD4+4pmUMym7jR0G6I3EAm1nZx6KrGj/mqPSD+G2Rnt2
bFqCXIFvaeuyXIsNVKGzMSVqfPtCTuAEGNHgl8hrjhRCF9WjEgMkumv2qMY9USHv
PjwuCZ568+WS80WMRC1JJHx7OrlX0QCeaR0RuhuLe3qjzpxmlJC9VSr/g/yKhbBN
8igxbhfXFb5XbdDWiOt3XhTNpC66oDsTZSz+jSeaFYb4oQ2ofwxyn/yV+KoJ/51U
SCIOdkE7tAA6v11ur/Pa2C1VSBVQwk2ceMTVb0HtIEhbjyPmH13qrSyk5UfdG2M4
Q4LEzkQDQ5v3LLmVolGgiNZicMnXYHZfuPkNR8LSrzzx0bxVteD6NEYRddYuniE4
1BEm5GMZLQyv97AuothdXfp9H/4Z9QjLGw8EYGZc6FWmaoz/s7N/+9bV5hJKQERO
VNLDJ0poqte9jgmJknDt1Bqc2JPLeV0wes2GxOsdIwUbBPgEyn+nC33KOwJpsAOX
EY9hvEv+HhNTdz4Kl266BrYVAygtJJtEtw5X64NzcB4kt5VyxBlIJ6Cf8SKVp5oy
yeUMqCJIueQHO8H58AjUZ0CJ6gB8AhT7wuG7DolkxQSinkB+p/w=
=yJKt
-----END PGP SIGNATURE-----

--ImtqRv6FePDydU+E--
