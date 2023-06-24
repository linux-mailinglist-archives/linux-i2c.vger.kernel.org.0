Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D213373CC9B
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 21:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjFXTgI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 15:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFXTgH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 15:36:07 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3C9113;
        Sat, 24 Jun 2023 12:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmrWlDERmaOPJ4KRXOmKLicuxezUn5/Fz5DyI7tc5W8QBLT+Mvt5v303TlanNffyJhMl+FlmohmOXxHR+2lAmOurofQ+fR56otwIzsjiEVuRnvSJeEeVlOPOozVocwwNtQa+7UFt+hyCrbynIw3uoPJUYxGsHeMeDpE9GH7nuGVTr1oqsgYCD7Pv6CIOLf8MMX+7ITVUoyI4/LBozwQgcB42B6a3mR5Jcu7kgkrl5265los+bbnFRgPFcw8zQh14CW6FXI+IyViunaMZaUUH+meB8lEdCtUVb0cXslxxzCBd4lLKmThEdJS404cQ3uWdaHJlOekgM8kInV7i4CjMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCcfITfwL2pg4I6K9fdKonSqgbOGc3gTiQT77Zv1aTo=;
 b=eNcw9kBiyKbf/243kUtD4mfmmdBPANdRY0fa79b9H+N+xxnKJkiKi7xdqGePfyZa7/FLBpRjkD+pIdyHHwwZnNXx/+IgdgHViW+BMb6sIG/FJbYLzgQUiM3ba9gLPAgcfSZMjGrno/HU+2SbE+gWk18mlfLpzFtJKmWOzzpnZtKSYbjUTEJHWmkq0Cz+kmzBbdvXQpm+ifMulBGdY+QadEV/j7jTQ4FDmZjb+aQNoNVQAT1DOHvPct4+KnM2uN1nBKrrkqrmpQYRF+MCd3qVWQY4FASx7cuZjTQS62N1eScy5cpyuPzxJLVKz3AeIJkhQ+U5awZQosUdu8aEb2g0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCcfITfwL2pg4I6K9fdKonSqgbOGc3gTiQT77Zv1aTo=;
 b=0HZou7TY3h/l7eRjYLdRjcJOcplpP6hkcswQY/mox4RViHELBQjOLRJzgF+doNuLijxMHOBgk8RUCfPZ3B3RJLXR/E0hzZc4xhvwgUNPBbTm5GylqYoB2iFRaWr47y5i38zVS0nmbHj99YXfVPMOqwEXnvbE7j4yFnWdXNT8ySk=
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TY3P286MB3802.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:376::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Sat, 24 Jun 2023 19:36:02 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8%4]) with mapi id 15.20.6521.026; Sat, 24 Jun 2023
 19:36:02 +0000
From:   YE Chengfeng <cyeaa@connect.ust.hk>
To:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Thread-Topic: [PATCH] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Thread-Index: AQHZptF4vW+xYGiqv0K3I948JeZ3Og==
Date:   Sat, 24 Jun 2023 19:36:02 +0000
Message-ID: <TYCP286MB1188708B1CE64D95FBACF9E78A20A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connect.ust.hk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCP286MB1188:EE_|TY3P286MB3802:EE_
x-ms-office365-filtering-correlation-id: 08707a4f-b7f9-417d-9b3d-08db74ea3e85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P2C3g2ZYCsFHNQu3KsG9YIk2Qc0K1p8eJ1LOmc+5XEEG0QfEYI4ZRZmiTN+CeJwDoGDrcqmfhRjZkbzzFvJzQSmEdiAxMvoh4CkNMJDZZ7vxbR8ypxvyBvEsBefLOEV0gf63ldwwwOqkGgrVdjstljL/Z1McmxqJRrIaZU+HBNU62aFC7QLwGszmGB2B9dLDR5QL2AnrrAGuArDeKJYqDIbw1E/XLgdvJ0mgbj9u1Bb9jAnEOibU4YJKnxJYt0w4m1lMXBBLcDLxeq+/OgWerSjwafU4bBAijWxvFXvGv5n6/3gW1xmriQ6MA/Onedvkfi++iEYMj0EeaFzhf3W9COyNG3P/KTERsRIAtX1OThNe0Fn7DdaAfu/bpfR+6DIE9ib6AVteWGXPP60qHjMqJ//zI/upBSUQbCL9dRbB3dpFxwhX0tcKciJBjEPDzvkQqnqndBqhOIjRYHg4k2NpLPfuUqkeN0+SL1PX7C7kgATY1nyd9SwpZjZhceWB7q2r1NokC8fzyZaswh8a9gGNtT0PsmrfzowkwPIfJ/Z4c1TxWqkCfhqzZ5S8KCTzBGe4EjNYiEeqGXJepsAyLEnBJCrjjQ2AeRTbVmN49Tzs58Z6hRLCmpstlXXKecXxEsM+EjAhVVr14giDGUealntojA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(33656002)(5660300002)(52536014)(41300700001)(316002)(86362001)(66476007)(66446008)(8936002)(8676002)(38070700005)(64756008)(66556008)(76116006)(91956017)(4326008)(38100700002)(122000001)(55016003)(786003)(66946007)(26005)(6506007)(2906002)(9686003)(186003)(7696005)(71200400001)(478600001)(54906003)(83380400001)(110136005)(70780200001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?joFeGMypGkGvPKEBkUTPgbhk3B6hGColkvtuZt9t+71bcTQ3Cgf5na6I6Q?=
 =?iso-8859-1?Q?XEfr41cH0MA2tGeiO25dU0gm2br6Nw7JCSZ5+gn7iColhG9GSNwp4YkOmp?=
 =?iso-8859-1?Q?tnTHTR/lkrl+TbLdQG6pF5Gmnd52RPJJg7Y2fLGIXfmbec36cHgpDrAyns?=
 =?iso-8859-1?Q?Tl0G4EmPPo5HNI/Y9YSEWYZxyBFZVVCWUJrLrVhpWvinv3DlW7YAs3l9DI?=
 =?iso-8859-1?Q?sUN1AKTzgMmLS0Sjj39zN1n184Dsrp80LqRfo7NpORE+cgkxFjKWyXsK/N?=
 =?iso-8859-1?Q?izu3bHO8CX0LzYmKdTaier/YNYSRdRanh4sep0ShhAvyo3cLBoFlVMBx6C?=
 =?iso-8859-1?Q?zbJxX8m+TzY/8F6aAThU73Ux6YpTp2IBB49jg0OMmhZGv7ZJN/gdAorE1L?=
 =?iso-8859-1?Q?S9ihoKP8eB2WB229K3orRqpEC4drscfUTHXWaCchFviLKjfJRsdmfuj4IB?=
 =?iso-8859-1?Q?EhfjckZrBNsjRWe18cnRGWSWwrZZZklpVXM6QPNvQVTvgfxL+ga1i/7bRo?=
 =?iso-8859-1?Q?AkPmzV7JG6mOnZj9h7F6AkyQa0rRi76cKXVCshz2f8yk9taTFgOnS2yahf?=
 =?iso-8859-1?Q?sJx01u1aWz0oXUag6VXKyEJHzXfpgQjz+BDQo3enGpV3LHSNfRl5OvyUaD?=
 =?iso-8859-1?Q?Yh/UQR3cbOm8V11GXdF4N2OItAF3VMF+4uGqbwixn7rDi6rZCK2/od+7ZH?=
 =?iso-8859-1?Q?h1UqBZVwOzqAeqdbBeSGB1EODKkipnCyL/gLDbeMrquLlTgyHe1g33WgnQ?=
 =?iso-8859-1?Q?XZK5CJu+XMoTtuJDsSYA6HLhwj82Ttn90On74x8F1C6+EaZrzK+fGve911?=
 =?iso-8859-1?Q?Ok0Nc4zc9Az1ysThKSJT2hzgyyl3w2tFNE5YR76P59cfPko+lY0wl5NKDy?=
 =?iso-8859-1?Q?xsLkrDIi9trpdFbpnqW7othCKU4WqBp9LCbUMQkHMc4qXF/n2HW7pvsdAj?=
 =?iso-8859-1?Q?qCCEYuW49GsaF2XLh4OfU++IYOqSydN4YtYbFggHTBQPGipEnCwgsQCzoW?=
 =?iso-8859-1?Q?sfc/0tv58egSTvjxUg2HCjy5g2/xnZfjmTx3n27n5GifgTOg/JdReMKpYl?=
 =?iso-8859-1?Q?DiebWbsdGI8vzLuMrtQyDziobYnurLcytqxHvVmBlwKVp50LH2bMFVL645?=
 =?iso-8859-1?Q?stUhA0xFWW6nzvx+mYw/HRYB6zJLJtWvmbVjD4K2GDo9443fKdgszVdvVx?=
 =?iso-8859-1?Q?JUjXKXLDH57ct/l+bzvWkB3Jyyx160gB6wpWDcJyUPKtTgmbIrL5eiaBR7?=
 =?iso-8859-1?Q?d87prP695mjf2uaIZSnwtG3WTPXnGcXCM/0Hxi5dmBIBAfQB/6Z8hEMwH8?=
 =?iso-8859-1?Q?8pYhtNvUxqATzYj+7W3dqMz6ZSAm2PAgjDOuX9ghqHJfSimLotQ62m3ItL?=
 =?iso-8859-1?Q?20yPQDGOygKeFQGxLLlqALq+swlu6lCVTcTlNZ2NLoya8jXtXhB7+jO6/E?=
 =?iso-8859-1?Q?0YI0MvVN3L5JI+AJOZUC63LwKqCNfmhcWp6u4WGdrdDrZBE7VCXcR8KXOk?=
 =?iso-8859-1?Q?HpmcO+19cE1i5hLbNrxwfLxovAKtSYGjuUItmbA6/GxNHZ/Ar2nMbCPs3d?=
 =?iso-8859-1?Q?mrrhSKdU1r83QWFhZVHsxdYKoorOGA/afeFFarX+a//aglIMVEzeMVN+UP?=
 =?iso-8859-1?Q?5pL94A6atVeoc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 08707a4f-b7f9-417d-9b3d-08db74ea3e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2023 19:36:02.2846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6Y5gYfDyqHF3qRJNbk0y3OMJGAwrlP3gLQLRGxMIHGVkxaKrfhdnsyNQa0xf9ZSB72GmtfdqsiYzVtuswJO3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3802
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

iproc_i2c_rd_reg and iproc_i2c_wr_reg are called from both=0A=
interrupt context (e.g. bcm_iproc_i2c_isr) and process context=0A=
(e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be=0A=
disabled to avoid potential deadlock. To prevent this deadlock,=0A=
use spin_lock_irqsave.=0A=
=0A=
Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>=0A=
---=0A=
=A0drivers/i2c/busses/i2c-bcm-iproc.c | 10 ++++++----=0A=
=A01 file changed, 6 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bc=
m-iproc.c=0A=
index 85d8a6b04885..d02245e4db8c 100644=0A=
--- a/drivers/i2c/busses/i2c-bcm-iproc.c=0A=
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c=0A=
@@ -233,13 +233,14 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i=
2c_dev *iproc_i2c,=0A=
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 =
offset)=0A=
=A0{=0A=
=A0 =A0 =A0 =A0 u32 val;=0A=
+ =A0 =A0 =A0 unsigned long flags;=0A=
=0A=
=A0 =A0 =A0 =A0 if (iproc_i2c->idm_base) {=0A=
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock(&iproc_i2c->idm_lock);=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&iproc_i2c->idm_lock, flags=
);=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(iproc_i2c->ape_addr_mask,=0A=
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iproc_i2c->idm_base + IDM_CT=
RL_DIRECT_OFFSET);=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(iproc_i2c->base + offset);=0A=
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock(&iproc_i2c->idm_lock);=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&iproc_i2c->idm_lock, =
flags);=0A=
=A0 =A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(iproc_i2c->base + offset);=0A=
=A0 =A0 =A0 =A0 }=0A=
@@ -250,12 +251,13 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i=
2c_dev *iproc_i2c,=0A=
=A0static inline void iproc_i2c_wr_reg(struct bcm_iproc_i2c_dev *iproc_i2c,=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32=
 offset, u32 val)=0A=
=A0{=0A=
+ =A0 =A0 =A0 unsigned long flags;=0A=
=A0 =A0 =A0 =A0 if (iproc_i2c->idm_base) {=0A=
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock(&iproc_i2c->idm_lock);=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&iproc_i2c->idm_lock, flags=
);=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(iproc_i2c->ape_addr_mask,=0A=
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iproc_i2c->idm_base + IDM_CT=
RL_DIRECT_OFFSET);=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, iproc_i2c->base + offset);=0A=
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock(&iproc_i2c->idm_lock);=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&iproc_i2c->idm_lock, =
flags);=0A=
=A0 =A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(val, iproc_i2c->base + offset);=0A=
=A0 =A0 =A0 =A0 }=0A=
--=A0=0A=
2.17.1=0A=
