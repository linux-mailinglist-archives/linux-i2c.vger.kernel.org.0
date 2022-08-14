Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B90592654
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Aug 2022 22:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiHNUey (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Aug 2022 16:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiHNUey (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Aug 2022 16:34:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5661D31B;
        Sun, 14 Aug 2022 13:34:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4080060ED1;
        Sun, 14 Aug 2022 20:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E471EC433D6;
        Sun, 14 Aug 2022 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660509292;
        bh=9q06kyE2udK1phB7VEA1EHNt2X9DEGxRQIgRAEXHAl0=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=JpJniBlElqD4OFXMGhOAOFRz4Qc6/U6eV8IVk7cLIZLWnUgDAJq69xECYoZIEoxpb
         2Ig9VfhUy21kTkwtnJ/Pivxo78x7/ZMOcOqtKU7bJuQOLYW3j/VHxQId9BDV2WltqE
         zFRooHgsDjxX84VafagqDyH9F6WVQPPwHcktFVaXDvz+17rTB0oGzeZbN1swwTR543
         7qxcJ4w1dEQNk+nFwv7S8OAnazPw81wwhY0RanaEC6eIqBQtqtZ19CVCV+jdEb8ZnU
         snROk2+67sAzxGvX/QdAzePiMVhkfvC9crdXH3SEHPs7bN8BsoaOEAbhfoWg37WICs
         ijhAa7qiyP5Ag==
Date:   Sun, 14 Aug 2022 22:34:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [PULL REQUEST] i2c-for-5.20-part2
Message-ID: <YvlcYh5x8Gh2lMET@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
References: <YvfGY2qnl2YXrUgX@shikoro>
 <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com>
 <YvhC5Orb+JeZFDEO@shikoro>
 <YvhXzarjOLEJ8nsW@shikoro>
 <YvidybasUAuhGPMB@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yse6F1JOWDzBQt//"
Content-Disposition: inline
In-Reply-To: <YvidybasUAuhGPMB@shikoro>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yse6F1JOWDzBQt//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Pushed again with patches for userspace programs in 'tools/' and
> 'arch/um/os-Linux' removed. That was too late yesterday to notice them.

Got a 'success' message now from the buildbot for the above branch.



--yse6F1JOWDzBQt//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL5XF4ACgkQFA3kzBSg
KbZa4BAAgf73pX0tem8XEo68qmB83yTVG905/uUGqbr81EHOAWC2b48LHuo8IXvd
24Zg14VMejPLZsUmcfub+z8dEzkGRLWGqgLk7ASP71+w7kchk1VNUeZaJ+96tGum
OB58ve7aRRtKcEH8fM0tCwVaDYDZig8taQ3XHb41KAto/3DRLaUzbDmCRpwfrRzd
Z5Vg6pAuywoqmcpC2EMuVIP4ZBrPzhOwAzl4i0JtT+TKaFvW4XpAVzcoa7AR48d0
+tm8zPYZjTXXLOnTerrS+iWzp+ceTnV/WkcZYkmTzHh83suyJhG+hjUsini5iccy
ea4XoowHYffflAz6Y4nh218ocjIT5J2NEcN2l/ixdX9Q5lKY3fmvXE30w1nxM2Wj
0OF7LqAbKUlvxRiuVjVN8GL5EQrrM5ycRyfERBv4lczSd4kvmChRiIgZH8ST8b8e
viV6ZjxMYBCpwJecCHpVoMDwQdjInwml4TwN4l55W7jQjXdaiq2h+EOAPviNICKk
Y3nIG0ZLTdD9vu/bijxejqAEkJoWlWy61IZYPUq/3h+KBujuB8FkDpjINJ9sRlvd
nGiX+FTeEFAnhoEncL1MMQOc+smAyfMFGRnJOj7muS/XNdAj56To5gHTAOmNbByq
OAOKnwYE1HwnvPIE/rBYvhwfXpjLhcYL5LX6wwZ4IKhQl6SujKs=
=FtZo
-----END PGP SIGNATURE-----

--yse6F1JOWDzBQt//--
