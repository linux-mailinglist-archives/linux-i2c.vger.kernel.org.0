Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1958A422DCB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 18:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhJEQYV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 5 Oct 2021 12:24:21 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:53843 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbhJEQYV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 12:24:21 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MGQSj-1mZ6wD2C4b-00GoB9; Tue, 05 Oct 2021 18:22:28 +0200
Received: by mail-wr1-f51.google.com with SMTP id o20so20319725wro.3;
        Tue, 05 Oct 2021 09:22:28 -0700 (PDT)
X-Gm-Message-State: AOAM531pKc1m52HcnKpFHo8RBXzOIGxGelc850BWe2j+v77o5eNJDoC4
        5eHiRp5RDbP/yLhO54XnpoctBAWVdGeAF956QGk=
X-Google-Smtp-Source: ABdhPJyKDaaY9N196wCOwS/aWHGILrM0TAfc16cprPxSzk6zz0pLue1dKsba6g/4ViVzYX6me24gdE9gUYPGJrVBfqA=
X-Received: by 2002:adf:f481:: with SMTP id l1mr22496230wro.411.1633450948179;
 Tue, 05 Oct 2021 09:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com> <20211005143748.2471647-3-pan@semihalf.com>
In-Reply-To: <20211005143748.2471647-3-pan@semihalf.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 5 Oct 2021 18:22:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
Message-ID: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To:     =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Cc:     jarkko.nikula@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sebastian Reichel <sre@kernel.org>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        ka@semihalf.com, Tomasz Nowicki <tn@semihalf.com>,
        jam@semihalf.com, amstan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:9fPGUYXH84OEE1UoL2FHzAUe7myIloj4HkAvI8wbL/KDY3Kj0Lb
 +cXOaSSNwQmnPBN+6tPXWsWYIPfaUItkVaI4HT2gcy09c6uJBvMxEaDIxZw7jnzixc+ee/h
 DSWj+9HeF6jWn92wLof9FskH4UC2Y0sPbKvmDNxKUyNnp49CeYLSvDpRfPD/cYcW6MzNeHk
 SjenDhO9l7Z1tp1QNFLUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B97t7z2eMfY=:vM+HQUPVqBL20FgSUzQrtC
 IQOHWCMkncvUNmRlAyZ3vwQWuka+23BMNYAT322oCXwiOvt2mCA5p2EnFSyECftI9SDOSDkld
 fqx9Uqj8lq1581/lxlKD+izsERtfA2IrDB1S1YvusTojLB/qFNWQRErfOAbvTA8M13MDjgC27
 a7IbCiHLOgREVccxduG2kEBAyNuEOiuQIvDcpNUmHgOiDx8x6/vUWoYkg/f/u7jnME2wSn8yZ
 1p9y0/fvfLHT8gfneB7OYPxqQRSuhLXJ0duhEm2d3CE6BmB4dcWRvnNbfBZuY+oZPV2UzfzTQ
 X1pjEgyvRYnxQMnhK5W6JrZOeYSC/UYtd2UNCLNPW3zG7j4sE97Pc910Ae0mYXYAYkNDnbq/0
 hq1iX6KRqUudO4Qit+J2wayp+fnBdH0RD4ZCSyLvmNgeP2un56DssLRGiZxlddfxFRMUYPpYL
 oLoAjrPON4i7nlYovQmNYPDUEcWALuHU9+AlKjlfimMhIhHbPIoI6zJWUMfMa8J9Tl/kOSMP+
 HdZLtRaUJ21o2KieNELEPuQUDIFzAPEtqGtlUtE/TV28xGKVSS2Q9+vOkB5qHacGRh38FLhYN
 89q9edtXhl4sfDMAOA9vrKAchp12UXIOxbnny6kNmr/paq3pqoC8GLsKC8AK573KBr1C1XmCE
 12wOnYCSpKtUs08iWjUWkJHSI/DM0W2pIsJ8Em6fGRrF//38jEIPMYJuZwe0SGndeIi+R4amh
 9w9evV1eV43+13ELiNRN+rgzokif6vMipQXyvmZpJSeHHD+hCdGSaQAJZon0F+k9/Y8onNgoN
 +gna1udMR4Kva1VwtogJpeUvCdrNwhsebbsRqgjv3fbKItU/EFygq5U51dAuils1ggeirysNA
 ue+Guu0Nd5X/+yMUgo0Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 5, 2021 at 4:37 PM Paweł Anikiel <pan@semihalf.com> wrote:
>
> On SoCFPGA systems, it's desireable to have fixed numbering for
> i2c busses, while being able to enable/disable them (e.g. have i2c1
> be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> be achieved using devicetree aliases (see i2c_add_adapter). However,
> having the driver be self-contained without relying on aliases is more
> robust.
>
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>

I don't see how adding a nonstandard property in one of the i2c bus
drivers helps at all. How do you expect this to work when there are
multiple i2c controllers in the system using different drivers? What
should happen if both an alias and the busno property are set?

      Arnd
