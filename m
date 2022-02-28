Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E886B4C7263
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 18:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbiB1RUp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 12:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiB1RUo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 12:20:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE0B7C16F;
        Mon, 28 Feb 2022 09:20:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 630E4B81544;
        Mon, 28 Feb 2022 17:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426B3C340E7;
        Mon, 28 Feb 2022 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646068803;
        bh=QeFrGCNc89SJdYUWHflD+YlxmOKGYrXkXFoTkBy4vjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aEHA3YO7T7ppz8EA4Eg7vscmAqI4yRmd/InzGzmCabLUpkbUMrs9pdWaapb0rKi/F
         fSrD7fZtKSIkvlHjTSGIdcBu1MJU/TPER80troBGK/eS0GPARCA34461tSbpvPyu6r
         pvmvvqCpfiJ55nRUyJnfmqRqdb6vV8GTQ+Uhm8/NAm5cZBn+dO637KZHoo8WoVErFz
         nTChyG+BVqwJlsTSZqXn5NngNw/8N6eqhCGiUqo3smXkvZEf0kgxSI219EJWkpyGG3
         w0qKO2itn47FK3RDebOcWD73VRMjV8DHLUDRyuZGb//oCW5IetaNp0gDtTCYLF6PcH
         A3c/A+99NSsew==
Date:   Mon, 28 Feb 2022 18:19:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Zev Weiss <zev@bewilderbeest.net>, Peter Rosin <peda@axentia.se>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yh0EPY/DXtBdScB+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Zev Weiss <zev@bewilderbeest.net>, Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
 <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
 <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PcOsCAVfvNqPfZDu"
Content-Disposition: inline
In-Reply-To: <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PcOsCAVfvNqPfZDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ack, thanks.  In that case, what's the path forward on getting changes to
> this driver merged?  I see sign-offs from Wolfram and Peter on the last few
> commits that touched it -- any input from the i2c/i2c-mux maintainers?

For the i2c mux subsystem, I usually wait for Peter's review.


--PcOsCAVfvNqPfZDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIdBD0ACgkQFA3kzBSg
KbZqPBAAirMQ2+kLUEJHshiQxx+oqoXe3l4b+oevdW4j7PQZyoM71DBl0dkG9FDn
vBYWm74HGKKbS0iB2IM8Z24YU1tO0bKphsc9rzZmsS9r49GYWeLTtoM07X0a2NsA
hPRfxU8RJdzJL62T1NuxZcT8nrZPDXyYy7JFO9sR7O6ZE4tm3Yl4U4ywZwO0ukZ6
lalIt7EQPSBTWR0gOOvOtikN7cZnTGAaFvKFN+UW/BgV7E00xrwddtC8rN71kPGw
o/uljkVFZNy8DQYwSlbG6DAvk2TocSocKuWsUT8dpxsICA+9T7avF59AWf091axI
DBtqJBwqxaLEAzTJTw9ZotuLN0GRPBIcIW5NQNa+PS1ii8PhuUY8vqQNLXBtHjsw
KcLdCM1GrhnoUtyoshu6TiSirZ5Bdqk2tC7nXZ1XIvlzaGzml7uYg+DFExRdQ6wB
6F2Ze1Gj35tNHxCwYnOxkkh3ZJ1vl8gsSxwVLBnCiODcR/jPFiJ44dp90VdH/Ud3
gw1/gz0/rlsRo6n7ZIkRPtOWXtc+s8RCvpsG83qLN/LRDTLLPcDV6HiuYAik3rj+
+Xugrks9xFw/a8RPrSZM/5kQnD9RJxYKP8V3mR98CMbhmbx3F6FI738eFZf1hKxf
sRvnXYOOZZsgbzIPojr+OSja1/z+Xj+c2+MFZZXb+2Rx/Pliknw=
=AoPe
-----END PGP SIGNATURE-----

--PcOsCAVfvNqPfZDu--
