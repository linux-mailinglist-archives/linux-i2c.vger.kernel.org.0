Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAAE2A5AA4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 00:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgKCXla (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 18:41:30 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:39814 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727754AbgKCXla (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 18:41:30 -0500
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1eaa70000>; Wed, 04 Nov 2020 07:41:27 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 23:41:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 3 Nov 2020 23:41:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlMKQWw4HzM9f7/bqWHGWtmFZ2TMFmzRuIdFANqs823sRgO3AvhgaBaXgLv5WAPKw+z3M65z8hj4cQiG0W7tHrctCk3o9e1sDSvoDK/96fUI0IvOGdsHU17flOmENiJXOlyQze800VM2dM77t16kgmGCbNFMQL6OlTZsKaKwOnhyAwxSey+8GSbfA2TXaT88VV50F3Nbp245qmU+rWbMFnrGltW+wjqniJKnOkvOf6jH/IgymbzbdY89ixuwP/8/E8oBNsZeZ5scaoP3H0xHC3d/gB6DKBJlIPBLbxpjZtMr1Tr7F3ILaJR1vYucdZ3RFAPpBP6ff51vbaJrof08GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L6y/8PkeCyKbnX889f7i/G1FUCH/CCQTISbpLaMZLk=;
 b=Lo2e9ryWoPogHQrwJq27Z/Q4mjZlYEeprPT97dNOwkGiEKDjWrX1JJqIMUKFcoXiPjrhIvNOZAYlNPMTKGABQRKPI8K0o4Qw7KsnLbMvBzkpbvus2JPhqeB4G2vlJR3MyZMXIEic1HGBkaCs6w42C3xFhRo7DNWXvcSUuRf+EE8EEywvh8d/kpXHg1CIOT6VBONkWQLoagiGYmQrZub9o7cf3jsQqjhupdh3ibajZVxrpgEjDJawb7kM329fwTqv5oTsDw2FMXCihn42OdvgJAalt+DuMRZDy3KxGZ1nLpsnBa9XseazWg6kK5tODGmiqU+qpr77TcrCT8NjnCz06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3310.namprd12.prod.outlook.com (2603:10b6:208:aa::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 23:41:25 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 23:41:24 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH i2c-next v2 6/6] dt-bindings: i2c: Convert DT file to YAML
 schema
Thread-Topic: [PATCH i2c-next v2 6/6] dt-bindings: i2c: Convert DT file to
 YAML schema
Thread-Index: AQHWshttx8StFjJLf0+yuj2kGuzED6m3DeYg
Date:   Tue, 3 Nov 2020 23:41:24 +0000
Message-ID: <MN2PR12MB3616EF781D88648E65A56D9CAB110@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <c81a0679413dd77e68bdf7e3023d1a54e62f26ea.1604432921.git.kblaiech@nvidia.com>
In-Reply-To: <c81a0679413dd77e68bdf7e3023d1a54e62f26ea.1604432921.git.kblaiech@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dce460ef-33b3-433e-2c13-08d88051fa0c
x-ms-traffictypediagnostic: MN2PR12MB3310:
x-microsoft-antispam-prvs: <MN2PR12MB3310F3D9118007AC8C8DDC56AB110@MN2PR12MB3310.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: po+1+Eulv59L0/IV3tmD0jWTMi3Q37OR7+6o6LX/mnM9QdVPNYPMCi00sc2bkxreNVm5M5xiT0lPNKBmmoefbTlCTVJqtcxKtcLTDaBFkVyvazWm5qJw3MzWELN9Xzo9y0c6StiP/NA7LuDOnFohzml1v+1PP0/3O4b8dinJFj3BAte4UnFbLgKV6FuZXH4hXQTW7az9WUGBoOQ3y/jB+hfUKEGWKh2IaaI8kufmM+9hBCTZnd2nF2jvNqo7qAHIcXNK7PSof7JKIPQA4gYH4TgX+YcRbKQWH9xyw1x8olsEDAluxtRCigCLx8N3cA9da7tcVo8cUpgNunoj1IrmbIas9dfSv/zUgzBt+zrlO3ldEzEX+gWAW2hfm7fzt+ZKYQqSrW6dGvGZ+i0Ew9N1dg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(52536014)(9686003)(7696005)(33656002)(83380400001)(110136005)(8676002)(5660300002)(2906002)(55016002)(86362001)(478600001)(966005)(6506007)(186003)(66476007)(66556008)(8936002)(54906003)(316002)(76116006)(4326008)(64756008)(66446008)(66946007)(71200400001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 4kzmKMhtbpkMvznALQTalqact3Y/Xo6mARcwoR08yNHWp0suTURGbX8JA5RVhKj1K1mHsUBZqT3e7BoDVH+XolWv1kNmvUqsHcSdE8r4l51AKXU7Nf+jo9iC391hqRfZytpMhr5p1/Hk9/C96r1aoRTTi4dKnfF2da2I7JEGrf+PhPRYUsMV/0zXHQPU8s8NyC0aalyyh/AoOSEfVhbSo/XQru/g0t8Sx/PaKOl+jjPq6qFuFrK409hy9MUcU4rARRtALFKg5c4N09ORGqkVEUnimwWXIe1Vum38qw0u7jlycQ/PMbG/bFVpo9yUR0W1fD0d+syfujFyAI2Ug+3DiK84vxz6299nhmnSf1ksWuAph6uQa3oPg33skPkjy9T6PFPyHAQbDksrKxyq+b21xW2lbN127yglUGb8xAiuaSIkuMqZUqj6BOEwRIhXMHpRvU9ji3uP0DhqPcudI37TZ0LrtPPf/Y4cAXFJoEplksvdOq1/8bjMfssMkW7w8It5PvyFYUB+n0Xgr9LhIpnQGanHyGSfURW8vndskubdfES0ckT73XiKbLVkTTCrAuYjWy1CIrp0TEHYZIxiApw2miLqm0AZ/A+yksDCFLXT8yMO6V44CV1mtSVRfu+AcVGnREoRtXhaf3tU9OKbmAoumA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce460ef-33b3-433e-2c13-08d88051fa0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 23:41:24.7763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mwiODUoLm+xGa1mvM9mwpHA7kA+LgDLCO+8/UzCrAE1VlzLYPl2rMdswkT3edNjuG2gCH+iv0nxYw0Rb1jo/IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3310
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604446887; bh=8L6y/8PkeCyKbnX889f7i/G1FUCH/CCQTISbpLaMZLk=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=Cuy4yGMKIK5E2Vyb0WRjoeZ0zQr/0c7Mx30aCecrDFkarEYOCVqvDpM93fR0SFXgP
         L95P9sDi5AWMxpboiciyGg8B5o2MjM9xScqT4qEnHoYZPJsEjpZTxlzLgkIT0ks9mB
         H4x0ET+E7iNmgiB/TwG8bBoUS5BTcR5NvJpHcrKkRga+81jdqtp4GOLlTYSZ2TTWXY
         Hv7UvyR6iT6eblrSNx/soe7otEVzpXLDDO24H8kRkzGoZ+CiZZtiGjJ+ToP+OyNBZk
         5yQcNsScfGR+MdZb9qAgJMAglSsEhNZE8QKlLBxlz5N7mgZzk/CRQH8hwQGfOZ0dxG
         Hn/BGi6zrzU1g==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> Write the devicetree binding text file associated with
> the Mellanox BlueField I2C controller in schema file,
> JSON compatible subset of YAML. Besides, add an entry
> within MAINTAINERS file.
>=20
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 42 ------------
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml           | 80
> ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 81 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-
> mlxbf.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-
> mlxbf.yaml
>=20

The test bot caught these warnings/errors:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/me=
llanox,i2c-mlxbf.yaml: More than one condition true in oneOf schema:
	{'oneOf': [{'required': ['unevaluatedProperties']},
	           {'required': ['additionalProperties']}]}
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/me=
llanox,i2c-mlxbf.yaml: ignoring, error in schema:=20
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/m=
ellanox,i2c-mlxbf.yaml

PS https://gitlab.com/robherring/linux-dt-review/-/jobs/828353356/artifacts=
/file/build-1393383.log

I didn't see those at the very beginning. I had to do
re-install the DT schema project and re-start the check:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master
make dt_binding_check DT_SCHEMA_FILES=3D"Documentation/devicetree/bindings/=
i2c/mellanox,i2c-mlxbf.yaml"

I'll wait to settle w.r.t reviewer comments, fix and re-submit.
Apologies for any inconvenience.

Thanks,
