Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA83254E0C9
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 14:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376865AbiFPMaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 08:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376864AbiFPMaJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 08:30:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF894D68E;
        Thu, 16 Jun 2022 05:30:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4A5F9B823A6;
        Thu, 16 Jun 2022 12:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC804C34114;
        Thu, 16 Jun 2022 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655382604;
        bh=7Znl3b92aroi5ubP2QPuFHtUeB1lmREHe3yTZnLMKio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KMYhbB4MGHuQC7Z7rXOsc2FXhm6jOgJDQRBz44Z8dcYeoscvlfWLHXSfXfOu68EQu
         BoSKD2hDsNQOQK6jicDyREOSlXJrg6n8CXz79Vc7dXdOtFAU2eRbyR5GbKzsyHxzNi
         t/Zlz3LGMch7uZaMNxdmHjingGmKLyS9M2YxTemFZBuK4E1zwzbxxiYUWHjcf4liR6
         3A2ifUFhYkleDyAuQaW685HxWajaIcJ1Vaie+QK/2f68+TECqshItMI7aXiwRlgZTd
         gl8Sm2UnRnBdg2Q3S5rUd0xAEC37GnKbcZdZRiFXXiRPepFplJ/duGh0Argx9ybpb5
         L3VcbWVU3R6rQ==
Date:   Thu, 16 Jun 2022 14:29:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <YqsiRW78NAL9rX9S@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
 <Yn+9QBoPdH8fMm/m@shikoro>
 <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
 <YqpB8A2uBi+4epHM@shikoro>
 <bf001ece-e981-3a06-53fe-6a8b637d69fe@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XXmZpPF7iOB6E+2/"
Content-Disposition: inline
In-Reply-To: <bf001ece-e981-3a06-53fe-6a8b637d69fe@os.amperecomputing.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XXmZpPF7iOB6E+2/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quan,

> On the first occurrence of I2C_SLAVE_WRITE_REQUESTED, the address is alre=
ady
> received with ACK. So if slave return -EBUSY, the NAK will occur on the n=
ext
> Rx byte (on I2C_SLAVE_WRITE_RECEIVED event).

This is exactly why I2C_SLAVE_WRITE_RECEIVED allows for an error code.
=46rom the docs:

=3D=3D=3D

* I2C_SLAVE_WRITE_RECEIVED (mandatory)

  'val': bus driver delivers received byte

  'ret': 0 if the byte should be acked, some errno if the byte should be na=
cked

Another I2C master has sent a byte to us which needs to be set in 'val'. If=
 'ret'
is zero, the bus driver should ack this byte. If 'ret' is an errno, then th=
e byte
should be nacked.

=3D=3D=3D

'ret' is used to ACK/NACK the current byte in 'val'. That's exactly what
you need, or? Does the aspeed driver not support acking the current
byte?


--XXmZpPF7iOB6E+2/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKrIkEACgkQFA3kzBSg
KbasSRAAnlwPKEfQRtRslfq95yxrYXbK6A2BATY1x3Thu50cFfbarxu+e7KMBRtt
GXFMJrp6wZaXio1xyqtc34OmNOFnZXpPUN6jClpYG04GMaJ4kZCC9F2gNmiTEE0y
RrL7ujffpI6IP4TGFP8SRuxHCJiNRN8KdGdGepah5J6r+y3AnMoaOFwmD9ha/ItQ
nhVcPtEPTF/JKbP0st9jr4EIvjLGEi3f+HWuzUwio/MaC/OFRjmzgw9Zwbu0qY1X
YoqHBh9SmbNwPcI/Enp54kjyWScxnWhtY3SEOY7bsdguBLGL4MWlsYGQOIeDxlen
Io/4k5V4Iw5S7oBAcN7YLin2knRiTgyY/IHGlA4G+UbDhH7VbCRVgJ+EE9HsaEHy
iBN/o3YtN6QmmM1DLYrZY3S4JlLFARhNNdCb6Im4+HGMWAP+3t0vBOJEYBH+/0or
v1Xv3/bzlHkniG0EtOKfVWLCmSLpFA97p2T98KPBFx5K3NTV42+G9hao529crYtD
JtLUDJYXKYxs5CdmX4tvpQzBET+GB/NbyzMiFOUJzkydVuOBOpMMRN80GTdbJTOc
9legjiqnXk797FKiB5zhApNH6UQ8HSmsja5Mr+Jhyi5lr52zZCj0bUJD+rP5Nz2c
SlNDdUkpNr6Pxkklt/bLg8R0L/Y75gQ2PWPWjOJSaK6JM3tdArg=
=B2+q
-----END PGP SIGNATURE-----

--XXmZpPF7iOB6E+2/--
