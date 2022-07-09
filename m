Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43EDC56CA81
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 18:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiGIQG2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jul 2022 12:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGIQG1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Jul 2022 12:06:27 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0195113E0D
        for <linux-i2c@vger.kernel.org>; Sat,  9 Jul 2022 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZlPlNDk/FmGLbnfej0pJ166q9k37
        AQWgI23YOHarBQA=; b=X5Mi2WhSYS3ssU4FsbaksAQh0rgRXfmD5uQx0ub0NDEG
        fAjVxPN3rvuXQKUfQXG4XvEQNGhG2AZedqVZIDIKCrjJc2ERKolCnlt2VsB9lN9S
        FRCKR2XypfJgZC6yWnT/a5hIRYXSpyyBctBBy6Gl7zdebmV7BKrmH/WUGNkVn0U=
Received: (qmail 2909422 invoked from network); 9 Jul 2022 18:06:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jul 2022 18:06:20 +0200
X-UD-Smtp-Session: l3s3148p1@d4uyf2HjmQdZD+wL
Date:   Sat, 9 Jul 2022 18:06:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
Subject: Re: [PATCH v2 2/2] i2c: Introduce i2c_str_read_write() and make use
 of it
Message-ID: <YsmneQ1VAKXMU7eP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>
References: <20220703154232.55549-1-andriy.shevchenko@linux.intel.com>
 <20220703154232.55549-2-andriy.shevchenko@linux.intel.com>
 <YsWI4nzQa9gmqKdw@shikoro>
 <YsgBkDeq/KeQ15HU@smile.fi.intel.com>
 <YsgcZHzjzqyJjKqQ@shikoro>
 <CAHp75VdJ2AT30md_nR3a_hY6L511w+4oqsAJ-CoE2gXitXCrNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zHbyfqMzo6/Cti3A"
Content-Disposition: inline
In-Reply-To: <CAHp75VdJ2AT30md_nR3a_hY6L511w+4oqsAJ-CoE2gXitXCrNw@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zHbyfqMzo6/Cti3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Okay, let me find another subsystem where this will be more useful. Do

Yes :)

> yuo have any wiki page about TODO in i2c subsys for kernel newbies (it
> would be good task to add)?

There is https://i2c.wiki.kernel.org/index.php/Main_Page but it is not
kept up to date. Do you mean "cleaning drivers from dbg messages"?


--zHbyfqMzo6/Cti3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLJp3UACgkQFA3kzBSg
KbZbDA/9FIe+AyjmEg9ON3TYLjMcM21C05cj4cxDDSX5aoeBkpRSkfXkuhj1U/A7
u5wRPnB6miHwtwEQXhic9osorCz4/jY7nq0klnoZQUBHVaHkWUsAq2e2qxZcgSR3
eDtSFwThH0gHhanBXzL/gOT8I7eahqT6RwCCLK3S82nJQvw5Y9onoavSFNyd0/2g
8FqF+lb6qnDsseaYy4PTzP443/2Dwzc9TY3Q9T/ndm3kR8L9M0pQIsr/TiwlevQl
917dl0A7BXUqnispE/kswzyDUvneB00aWjGPd9QQ1pEpsheqKo+tgbfdzMFfeEyP
Z4RO1eNjJHU8cqIoR3NXH32bdTSQyxSCHKQK2KE1G7ZRPbMJ68tsa52MXf1iTYGH
U7DTmWTsOtBU0eQzcX0vSEcIpjfn7dP3IGwvlMExx40mP+9RcP6zrt+u3b74wpeK
gCIghaZ906PH6W9OetFH6H9EXju1M37b3jCdCWednDcWEnwvNIxPdmcPGrl7D/K+
tD+pKE1bVMZBIYnj+QG+ULSzIb2HCIseWXxiMgdklPs7q9J+AZD2ayIumKuDeQn2
E++oGGmww0s+bjhYTG1WkVUN0Es5h9AwXFEcJfkaXBkiSi8KQixfnotFrSOpNVmm
XsE9AdyrN3AFFQ5qWmGiAMbDhQ29gQz1+pHY6221Bqe6YMSMrYI=
=AtXT
-----END PGP SIGNATURE-----

--zHbyfqMzo6/Cti3A--
