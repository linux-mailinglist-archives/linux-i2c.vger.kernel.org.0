Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0A35EB097
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 20:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiIZS5U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 14:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiIZS5T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 14:57:19 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF2A63F02
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 11:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2FR425MnpFbRcS4Wkg44QJv+M5yF
        ttiCMas2rQtol/c=; b=uEAAYXYt+DPZy/t4lkxwXOzciGjnDSFQ7KJkgwwRLxNi
        KJBj5ZAzZP78uaZwVxwWqTr7b0O2Ga6XdtT4lLAEJpVYKghM+9KNCzuKnaSIlP9k
        qBxU5eh+WDkXlsXQCtOEmpaCub0veh6WQhGisrNeLXgwwF4QD0xJLZxVHQTvkMM=
Received: (qmail 3230396 invoked from network); 26 Sep 2022 20:57:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2022 20:57:13 +0200
X-UD-Smtp-Session: l3s3148p1@9ChGGJnpSqQgAwDtxwncAPgJb5TsabMI
Date:   Mon, 26 Sep 2022 20:57:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: How to remove DT support from a driver? (was Re: [PATCH v5 8/8]
 i2c: i2c-mlxbf.c: Update binding devicetree)
Message-ID: <YzH2BQkbqBfOEk7O@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
 <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
 <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
 <Yyttt3DiQpMZYejA@shikoro>
 <20220924173125.GA989070-robh@kernel.org>
 <CH2PR12MB3895753865DC9318CE61A131D7529@CH2PR12MB3895.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0euI4NmuGxy/13VU"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB3895753865DC9318CE61A131D7529@CH2PR12MB3895.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0euI4NmuGxy/13VU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> i2c drivers (even if we have no support for it and all our customers
> have to use our firmware including UEFI ACPI tables). So it is

Because of the "custom firmware is needed and it is only ACPI" fact, I
think this is one of the rare cases where we can actually remove DT
support.


--0euI4NmuGxy/13VU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMx9gEACgkQFA3kzBSg
Kbasrw//e8SOujrbaKHOJRSmvN2FSCzkmKrYNL7CY0N8XlS/gVpEKTJmkBYBx6rU
ErxwNe/64nAF3bZ1hwCApfd+2p7T4dLLc+AjGqRiDv6H8XnZ4y0qCoXw+dGu4cPw
t5YZmm2SIntvqIiIEbFjcGkw39mbdQfYrNS+3pT1SplhEJFkwyI75cZ63f9GIXC0
dEK6CXcXbVQ22p76MhAN762T5Jp5i0H/HDxDqLhfJLnNomaIfB22X2rBf/VTDEr6
5t1JwmCmjy2NatH4NuwywzSt2mE74zi0/iWA3QyKhDaTWK525syKZgXaJKdOIGXT
y8nH6qg8e5Nxpsy8DunNCfciCqtB0Uwe2sh1AgqGDDIbpdXc4tW/2SxC6XbIvUD0
DX+bwb+rqtTD27DYpfSdqt0kDcrkGGgSx4fUtw7GRzQT4XwryCAZKi/C1WQKIc4M
AaukjNjQuemW/29e96wzBqXpLqJkW6z3BW8ghdsrPlPiYo1HvOSBLE1HLVolOpE5
7kg7XrgAM4rW8FoZLPP0KZkzJT5PWQ++fkPdsK/pdzgHqp8gw7YNbovseOlOnlzB
ez1MDo44Xdo+fXBqLhhuHDPl+9+tWxJbRyWvOQtmkVeuPWVedBcWLBVS6JgIsf7G
HxB2g+fIbm0/ePYVoYc4O+VgPzAICLx525vecwymoqsXUHeA9JM=
=+KGh
-----END PGP SIGNATURE-----

--0euI4NmuGxy/13VU--
