Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E619B5271ED
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 16:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbiENO00 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 10:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbiENO0Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 10:26:25 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA7EDF48;
        Sat, 14 May 2022 07:26:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C600CCE0ABA;
        Sat, 14 May 2022 14:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452CCC340EE;
        Sat, 14 May 2022 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652538381;
        bh=ToD809RuY6hiXX+oncfqN67gVFXAQVrADjiQjJV3dEI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i65GwFOC0zB83eUL9/lR2auEhM9UrNTQT2dN75bb0bl90eK/Bx5DTmmt2nDK4dsRP
         b3SvvU9TskXzHzbOUK1e/oIuaVJhJwBQT3Yy7EIRL+7OBjFafG5TKHpAv8oWKGOvP4
         E4a84GMXmT2I8LRhA04FSdNw2JJBf7ocBTB7JbLPHyY0Czp6APaLGtIVpEXia65z9C
         Ha2Q1sAr6UNntams5ZDpedtIzbVH11PbMLdtMqxyh8BCokqvSaWZnu5t0tMIN/gTpi
         bNXTG/LUOGL/hg02MAlq401zTCLeqF76C68zt3W7L4MESAVjfZnB8FnQSFh9Wh9w99
         qxfVnJoruzCuw==
Date:   Sat, 14 May 2022 16:26:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Message-ID: <Yn+8CJ3j2SY2+Mq+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>, kernel@axis.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NL3Sz6YKj32sHoBj"
Content-Disposition: inline
In-Reply-To: <20220412085046.1110127-2-vincent.whitchurch@axis.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NL3Sz6YKj32sHoBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2022 at 10:50:45AM +0200, Vincent Whitchurch wrote:
> When drivers with ->detect callbacks are loaded, the I2C core does a
> bunch of transactions to try to probe for these devices, regardless of
> whether they are specified in the devicetree or not.  (This only happens
> on I2C controllers whose drivers enable the I2C_CLASS* flags, but this
> is the case for generic drivers like i2c-gpio.)
>=20
> These kinds of transactions are unnecessary on systems where the
> devicetree specifies all the devices on the I2C bus, so add a property
> to indicate that the devicetree description of the hardware is complete
> and thus allow this discovery to be disabled.

Hmm, I don't think the name is fitting. "no-detect" is the desired
behaviour but a proper description is more like "bus-complete" or
something?

That aside, I am not sure we should handle this at DT level. Maybe we
should better change the GPIO driver to not populate a class if we have
a firmware node?


--NL3Sz6YKj32sHoBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/vAQACgkQFA3kzBSg
KbbFog/9Gv3IJ+MHl6N3qQ0ieQcG5+wD+BO8/McbKQuR+2LqOOd8LVx5TV1+5czC
+Ef69jO9ch6vV5T9WVrnErF4h1wtGiK5HF/1AnMjagTXtNNIaxbyEOBvowY4hVUM
E58vzkrlZNIKY+147vnatDWw670DOTAP6GvvKg4cfGSK0ZXxRGkuXzWreYM9seJD
V1L9EpBDEZ80Y6RYJbWzExPyslGja8avFLzOqy5Q4dvsHnB8P7Mq6jrQXB6bqNWQ
hakv42huhY+WzplBlqNpfUiqGOC/5C71s17g8NKQ5BZfjV+HSO9L1ueHgFsOpWS7
6PEj8o2t+GJagce4TZJ2ofi7YrJNRNemxK9uLNwmdmmcLFZCTBxn/3/rZQotCPzu
VM9HDgnNQhdavit/Sqw9Vq89oeAq9QGbj/FWCTIELbmToVE0d3ufuWaLnDPctLW9
TzWV2C/B/zjDtglZmg1fjJI5nr38l7qpWbhd95rzxO1vsYSXTwYRYfOIGukgDNlj
gURWV+df7I89Rc6DL9ZSM5qu0h7iqmZLbE3RAnqrYjdr7AVXVqq2rmu0r0VjkzYw
6rzr4BN6oWPrthHLWOCsz4uCIeO802Vj5hkXqKRf8SrhkyoQFTv1H3RrSQ/F/qmV
diN/c0v5IqmndTctQau7yl+AuCgj9wJ8M32Zb6N+ZZuyXQr+EEU=
=AA2G
-----END PGP SIGNATURE-----

--NL3Sz6YKj32sHoBj--
