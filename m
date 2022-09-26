Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5115EB197
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 21:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbiIZTuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 15:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiIZTuO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 15:50:14 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBE015734;
        Mon, 26 Sep 2022 12:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dblHC2+tmOBydu7jJDWobO5+v6qLKRU5QXrBx+8BObHtT2LPoAYTIGfrzlehDYFcjTllGOgDKa2ZSJYeL1sOGH94PgMsqlTYPz2RgyBFLqlWRlIr6RVfNG65/5JPsR1YZtLBykEzuSxXcUt69IpyM+I4OP7HpYWIpcwGKRHv4/9UYp/xLk+BMMvQoNNDpISp8+gROtLq0EZXQ/ThZU0fLcZF/xEEMA9noib6x2obMCMCsN4zEmfhcMMlrx9yVISwHIT2/GpU2D6TdgeHkrKkugS9RdTbSj5G6Stx3W2XcZn/EMB0lRT7WqMi/OR4s0g5BVgEG1CwYmqmCYhCw9u2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0xw3qxgiK3SAjy31ISmdOnhl7xdVnbBfYNSQTgLPIU=;
 b=UgfiWOz5mvDPTAXLVa55ue0kMkpnjtAtIWGzwRTL0iXCpt3KP7QBkfMbgR8VOoR98p1c6KNo7oBSOpCPzyY1KVYPtMcqoR6kdmc1j9e9HWrnLX3eG8XFGxIdj5SAYS2in5wx6Z9EuKHjcyanK4ywOjjmTzlo0oAQouJ8cDBfQJOvq9piXHhruQBqnLn5GtljbTvpr3jBmaTSaqZekponj+OSWwiSKQc27KabMQxoa9aGt4OdJu++Dw3svA+7lk47U2ynLYjc1JsX6DiBJTjJmQh2Qud6z3lGCVA4uYlHMSZSh7xRN06/yt5jSLvr52HXY1eeYPIONLP3wmZYOwrBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0xw3qxgiK3SAjy31ISmdOnhl7xdVnbBfYNSQTgLPIU=;
 b=ckoViqvOf0wsb/ETXwcOKnYkHc7mte0P1GoFqLKig7iv0fEefwFKQFIcSJhyAbkNkLcMvl6MSP/ZLbcy6gg7L7S7u1gJgJE/xhw3laoimQNcfAf3ovHaXDb9ZidQNlcHfDOyXYmk1tlXs9oF+2NAkWUHzF6XlerG/9d405sr/w3Owxr4T5yDcRJM985wt+5hzlLuzKR/0hA0sDr1c8foIu10jWFzK6L7/LlFBB1qULsSdWjxGkoDcMdrQFJbgYy5rI3cFLN9O5/gam2CLY9bZV/0EH/fuSoS8GQERP0S7+bw5mhYgNv/RN8zjSfQc0LUT/1cOfvQdMmERpWE9Mk9pA==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Mon, 26 Sep
 2022 19:50:11 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 19:50:10 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v6 5/5] i2c: i2c-mlxbf.c: remove device tree support
Thread-Topic: [PATCH v6 5/5] i2c: i2c-mlxbf.c: remove device tree support
Thread-Index: AQHY0eCNwayZ0lmw/kiDVDWY55ZHdq3yHnDQ
Date:   Mon, 26 Sep 2022 19:50:10 +0000
Message-ID: <CH2PR12MB38952B5BC0A695DBF484E5E9D7529@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-6-asmaa@nvidia.com>
In-Reply-To: <20220926194507.24786-6-asmaa@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|PH8PR12MB7208:EE_
x-ms-office365-filtering-correlation-id: 36edc612-1b2a-472e-5183-08da9ff85259
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wd/uyr/GWHOAUDeFxMzW57sIbCygYAFx/Ja9X/inhJj/Vi34Fc4vBhoR85Rdo4+97FbtwvXbO1mn8SJACOH2zoqCNIWUi1r/kuO1MWLyz9Y7GBSH0X614peLqlZ6sHNVbyP+FcOVrQEJdE8RjJRwPEov457BA3t68TyyjhRscLJYXTH4UZ74tWGFX06C82UIw5YBxHJC/KFgi+oeEX20FAZMU4ZnCHpGscpv/EquuF+VnsC3FT3IowvcbYoMtlz0tyWk+xpFwlthLn5pOSvgYGoPN+orDp5uSmAI2fRtOv3ZDCHeSXgVK2iA/TfUWhJe/+dfkj4HV75EdZSfY+actL/ZMj24ut4uwbMJvN78Ag/1GdgaZ9fHTM9m1iqwrGg/gHFLPXMnREesfU4xcCnECc9nYt9MImOWnH5hNmhh7WG2TDhUUEIScB+HS3gJZ9jAieqtTDLrekYwymDizpsnek0OtnCZ/grm8EJStgHPiyDc5nbav4lML+mukZjbvptFIak+DQBOpNMbZCymxTjLGPGuINFL1VRuzgcdJR+mNnfkVhztPY96vCN7nPgpInx2BIq7teaoDI/BwiXYK2PPJM/AQPHW8GFksFzYpvvvzYQIXJXziiNmiGG/Cww+CoO0YGe7hhf1oUhYHBWRyAByr2ss4X8Vw34x5IIEpmLWcWbRLajJq9ONbkHpa9LR8iHD/nvNYZz9shae7S6rUWSCgN8d+Z2WXD4L/sM/nPb2Yzmav2LJLI9CzJ8W6zD8TrBnMrJxOrOJq3ZV4zg4F9hMClVd6vM3njr3OzmTLiD3Eg6wqd7XyzS/PSOXLVcFIFQUZrmdY9Qm9zwQogW4pXELY61MET+9wOdZmw1xdYz14SA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(966005)(55016003)(26005)(9686003)(52536014)(86362001)(478600001)(8676002)(38070700005)(66446008)(71200400001)(83380400001)(76116006)(41300700001)(2906002)(66476007)(316002)(64756008)(66946007)(66556008)(8936002)(6506007)(186003)(7696005)(110136005)(122000001)(38100700002)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9VAyCHmFXrCNjgF6qJhvPVLgwxeQCoiAVoTjBA5wynzFzmIhofi0G/dFmFIt?=
 =?us-ascii?Q?++f1GT6cNHpzfVgJ/ptUOJOkeGK0mxkhYJujoEIz2bwDBab58+QFi+FF3O1p?=
 =?us-ascii?Q?hWZT0/0rHWrzO6Qb00T1IBhTzoEBZ0t0qY4CyKYKg5kz3d7UmCUeAMo8qnGz?=
 =?us-ascii?Q?mC7jDsvKvxuYkE1S0Pm/QHgGfKoZ/FzkMmghugRjzrWXmnldGRkMsc7tzPP7?=
 =?us-ascii?Q?6lOWc7TJwyNLScFDqi9aiAl47KuiHDCv+6ZmoW3hdTAhCIYW3qkpkflXvMPL?=
 =?us-ascii?Q?0noHmv7TsYYeM5ifwxaRmSNBZ990Q/HtUV5ksnanP9+Pf8/1sBQdC/1g7aJ6?=
 =?us-ascii?Q?YEuDjuy3hLm03C5KoRtWt+7OvrEL1AMIF8Q25ZzHJKJZkBlZc6CR8aTyw5ZO?=
 =?us-ascii?Q?Nnir/nEVcmhrxFAUdW3dcHGDduIV6oPpWp7pqJwh/VxY6V9Jyn1ZDKyO1Qqx?=
 =?us-ascii?Q?QYg/JcOUc1cxSewuKjTtfo/k8h3RmoGb/Dmn/fIhFK8R95eLqdDuPdKorNyO?=
 =?us-ascii?Q?eNA/OrHXDaf/S7g7eYUVTvBD1TsUD4ZtipM8XzxZONByb+3lYZiO6F6UFmAs?=
 =?us-ascii?Q?PvNX0q5zeU/V4iU70b1PXAdS2YWI9bhznyYnp40HblXb38UxNbyhARt3bjr+?=
 =?us-ascii?Q?hjDeuz5WkCT7Bbh4t0u5YzK53iYK9F+nqGI5CTWYvxiSEvyeB/YR/gtw6y0B?=
 =?us-ascii?Q?2uJyr+eGhY7CMPl5PPxLPhukC6cB9peYivmyQIvXiI4ETuCUMQ/zBWWujeRh?=
 =?us-ascii?Q?Z/te1WJ+qtO1BdgU27nIxHjsLzqRYuSkDfvYBOPGsJijtleQDwZFUCbLVJvB?=
 =?us-ascii?Q?0QS7gEo9qmVromqNPo7FXaxvKCwVzDxC0L8rzznkrhZTX9Clro6vztMK5aAf?=
 =?us-ascii?Q?nH1BDtJk0e4DUO71w2AukBdqSS/HzHcEKdV2KVA6olaRRiBoMiovAk0bPqX/?=
 =?us-ascii?Q?AXPtUiUW1R69Hs9LVky4r1NK8EXGCbw6qBFriXGMIueoBrP9uJILjM/T49lw?=
 =?us-ascii?Q?sGkG5HcaDJBXhHNeE6HE5bPyEbLgF+SwTdAsJUpom4b3tHNPpVCiwI2gZPVA?=
 =?us-ascii?Q?hmLVIICo1+18JgwbV2qAC6Mbub3iK9f21Ds1xO37qg0aBg4VTH2qCLWvsxLk?=
 =?us-ascii?Q?cgxaprVXRNjvHH9OLZmQyQ/gkMSRNHv99WI2dj26+w3UuDy1DBzbDkTGbGDd?=
 =?us-ascii?Q?bHtjiXjbzQ+Jzm0y/ApPItxH/+/deNoNzo5TOlOsDBOb8umL8WgbVYUqPJ0m?=
 =?us-ascii?Q?Q3OdACXhLWAFd/17cWZ9vB+LI0EIoUe6PSeREPmuwZ55UbO9x9H+u+QuCfUz?=
 =?us-ascii?Q?4B0qhpr9VD2cDgNhV8ZYqxZ/jbX88GjIi9tnqccSW3cNfmZqLDT7aaumBqDx?=
 =?us-ascii?Q?UIT+DB+AneOfJRmp0au/GgYF7D/2puEH8yPtgOV3uxb941xy62S55QMcofDw?=
 =?us-ascii?Q?4O1RjEcDBjoEozkkAFDsiO5PzMk5CysagZfKPsjQISWOrKUd6cNgteQZ06ud?=
 =?us-ascii?Q?b2U++2esDISWG8mFzDjRX0n4EXXieQbnX+gvx0/BCh60cMhRJOQZDBrjoEN7?=
 =?us-ascii?Q?BTqVcxljO5Jm0sFM4Zw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36edc612-1b2a-472e-5183-08da9ff85259
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 19:50:10.8481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TonX9qIkL/PL2NcwkibwfySBVbeWB4r12SELH/1nL2yg1CWijVleM9bpNZht0SZt7CCSjEj2n3kl4RSY+pIyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7208
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

BlueField customers have to use the the BlueField firmware with UEFI ACPI t=
ables so there is no need to have device tree support in the i2c-mlxbf.c dr=
iver. Remove the device tree binding documentation as well.

Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 77 -------------------
 drivers/i2c/busses/i2c-mlxbf.c                | 49 +-----------
 2 files changed, 1 insertion(+), 125 deletions(-)  delete mode 100644 Docu=
mentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml =
b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
deleted file mode 100644
index 93198d5d43a6..000000000000
--- a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
+++ /dev/null
@@ -1,77 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) -%YAML 1.2
----
-$id: http://devicetree.org/schemas/i2c/mellanox,i2c-mlxbf.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mellanox I2C SMBus on BlueField SoCs
-
-maintainers:
-  - Khalil Blaiech <kblaiech@nvidia.com>
-
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
-properties:
-  compatible:
-    enum:
-      - mellanox,i2c-mlxbf1
-      - mellanox,i2c-mlxbf2
-
-  reg:
-    minItems: 3
-    items:
-      - description: Smbus block registers
-      - description: Cause master registers
-      - description: Cause slave registers
-      - description: Cause coalesce registers
-
-  interrupts:
-    maxItems: 1
-
-  clock-frequency:
-    enum: [ 100000, 400000, 1000000 ]
-    description:
-      bus frequency used to configure timing registers;
-      The frequency is expressed in Hz. Default is 100000.
-
-required:
-  - compatible
-  - reg
-  - interrupts
-
-unevaluatedProperties: false
-
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - mellanox,i2c-mlxbf1
-
-then:
-  properties:
-    reg:
-      maxItems: 3
-
-examples:
-  - |
-    i2c@2804000 {
-        compatible =3D "mellanox,i2c-mlxbf1";
-        reg =3D <0x02804000 0x800>,
-              <0x02801200 0x020>,
-              <0x02801260 0x020>;
-        interrupts =3D <57>;
-        clock-frequency =3D <100000>;
-    };
-
-  - |
-    i2c@2808800 {
-        compatible =3D "mellanox,i2c-mlxbf2";
-        reg =3D <0x02808800 0x600>,
-              <0x02808e00 0x020>,
-              <0x02808e20 0x020>,
-              <0x02808e40 0x010>;
-        interrupts =3D <57>;
-        clock-frequency =3D <400000>;
-    };
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.=
c index 30e6ba1f412c..1127d07b56a6 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2247,24 +2247,6 @@ static struct i2c_adapter_quirks mlxbf_i2c_quirks =
=3D {
 	.max_write_len =3D MLXBF_I2C_MASTER_DATA_W_LENGTH,  };
=20
-static const struct of_device_id mlxbf_i2c_dt_ids[] =3D {
-	{
-		.compatible =3D "mellanox,i2c-mlxbf1",
-		.data =3D &mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1]
-	},
-	{
-		.compatible =3D "mellanox,i2c-mlxbf2",
-		.data =3D &mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_2]
-	},
-	{
-		.compatible =3D "mellanox,i2c-mlxbf3",
-		.data =3D &mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_3]
-	},
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, mlxbf_i2c_dt_ids);
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mlxbf_i2c_acpi_ids[] =3D {
 	{ "MLNXBF03", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1] }, @=
@ -2315,31 +2297,6 @@ static int mlxbf_i2c_acpi_probe(struct device *dev, s=
truct mlxbf_i2c_priv *priv)  }  #endif /* CONFIG_ACPI */
=20
-static int mlxbf_i2c_of_probe(struct device *dev, struct mlxbf_i2c_priv *p=
riv) -{
-	const struct of_device_id *oid;
-	int bus_id =3D -1;
-
-	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
-		oid =3D of_match_node(mlxbf_i2c_dt_ids, dev->of_node);
-		if (!oid)
-			return -ENODEV;
-
-		priv->chip =3D oid->data;
-
-		bus_id =3D of_alias_get_id(dev->of_node, "i2c");
-		if (bus_id >=3D 0)
-			priv->bus =3D bus_id;
-	}
-
-	if (bus_id < 0) {
-		dev_err(dev, "Cannot get bus id");
-		return bus_id;
-	}
-
-	return 0;
-}
-
 static int mlxbf_i2c_probe(struct platform_device *pdev)  {
 	struct device *dev =3D &pdev->dev;
@@ -2353,14 +2310,11 @@ static int mlxbf_i2c_probe(struct platform_device *=
pdev)
 		return -ENOMEM;
=20
 	ret =3D mlxbf_i2c_acpi_probe(dev, priv);
-	if (ret < 0 && ret !=3D -ENOENT && ret !=3D -ENXIO)
-		ret =3D mlxbf_i2c_of_probe(dev, priv);
-
 	if (ret < 0)
 		return ret;
=20
 	/* This property allows the driver to stay backward compatible with older
-	 * ACPI table and device trees versions.
+	 * ACPI tables.
 	 * Starting BlueField-3 SoC, the "smbus" resource was broken down into 3
 	 * separate resources "timer", "master" and "slave".
 	 */
@@ -2539,7 +2493,6 @@ static struct platform_driver mlxbf_i2c_driver =3D {
 	.remove =3D mlxbf_i2c_remove,
 	.driver =3D {
 		.name =3D "i2c-mlxbf",
-		.of_match_table =3D mlxbf_i2c_dt_ids,
 #ifdef CONFIG_ACPI
 		.acpi_match_table =3D ACPI_PTR(mlxbf_i2c_acpi_ids),  #endif /* CONFIG_AC=
PI  */
--
2.30.1

