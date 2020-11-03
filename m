Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4058F2A4745
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 15:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729424AbgKCOG4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 09:06:56 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18791 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729504AbgKCOGW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 09:06:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa163de0000>; Tue, 03 Nov 2020 06:06:22 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 14:06:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 3 Nov 2020 14:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiibzjF7ikhP7EdZu+6o/JgHS/iJ5gZ5xKRe91ECX1Pz1e2X+YyyjTJ1PXiU6oEzBPqycSW+xQgsilsFc226vlbtmM0VRwUpLv4VFayNJ0U0GfeJULMpAd5rMgwwqvIIpsAWbkpO7JMbzyebycvpJQ8NrzOQNBzwS+plZyX7WBHax6s+VcEfLXKKQDeYaE3qR+LDbx6dRsCxmHO6aATBC+5zZKRd+xbzqLvr/DcQlY2Ct+NAHlDh2UDRMjPEjLUxBPadBIyfIuN+LI8ewVRsW+H9VqUDtsd/lGRcw1GAT3UBmCa1ktZ6Z6pD+Ml6q2fqIogR1ORR1Rp+uGYkZ23Fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNSkykSyIW3MLUjAUR5B3JwzR0H3mYN8m/Vz7H7+Ou8=;
 b=GHYsOoKSxWT0NVDsSFaLM21TCixVdKI424mX5c0yEIeX9wMPa5bWM/zFvCxRNJEA/OADTOs1FF0t/KyRiNwhNrJtAo1DXCWqLWbwmdoQNY0uCjpt4a9hi4sDD888hi9BbRb9PNOTlvkFR2M4rtpn+zbv7gi79a0KHZrdcZ76Sb6LKE2BiL6pqyuzE7hAp73dEgyaeb0IhZINOthZzKQSVAaqS6iLdSIDnmLcdvb737ptT8rT739uyO3UEjJJ/I9cB0TDCjXdvXtS2fhEHF6lZZEdq0BqPAm9fOUfKp5ZRloI4tp2z3P0/BGm3n99DvJHSATnxcstA6Qf7Jl6LPnSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3360.namprd12.prod.outlook.com (2603:10b6:208:c7::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 14:06:20 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 14:06:20 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Leon Romanovsky <leonro@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH i2c-next v1 6/6] dt-bindings: i2c: Convert DT file to YAML
 schema
Thread-Topic: [PATCH i2c-next v1 6/6] dt-bindings: i2c: Convert DT file to
 YAML schema
Thread-Index: AQHWrX2HV/F60Fhs10S889Dvf01JXamutqQAgAfDFaA=
Date:   Tue, 3 Nov 2020 14:06:19 +0000
Message-ID: <MN2PR12MB3616EF176B1E7807D26C16E4AB110@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1603925077.git.kblaiech@nvidia.com>
 <77461da87050051e0d2e7decdc9b088ff8738e19.1603925078.git.kblaiech@nvidia.com>
 <20201029153312.GB1905314@bogus>
In-Reply-To: <20201029153312.GB1905314@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3e743a9-04af-4298-a29e-08d88001a38b
x-ms-traffictypediagnostic: MN2PR12MB3360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3360DD449C891282E00C04C1AB110@MN2PR12MB3360.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E3fKHKmPlgIQA0lmHu9HABz5aymYiMcBvz5x6ZLnpF80DPgL5e3yfg/UlhO4Oqhrj3yJ3ewAl8M/joPtKvwVaRqFhE4r812/U+NyXb9CZ7C2ynJfZ7DY062fZB2DnlGF2u3l76aBTHw2hwE/XLRZOYS+QcSIrwxKF1r05HzA5Zb4k9rwdGR1/MhOPW4K+FwOpMnukMmJOL98nvk+HGPzKKa4x3UZm/4gRbwUjkIJNjgnpmLVqFM9wUAx3RAHaYq5ia+pkP3PlWTD7vZL3cKVB/kUpZEnHXCAdpSxnvJdqwAn7ih93zV7sns94p13+lnLFZrG43l/+/UFVhF/VNjztc8pdUejJpTkkHxx0Z6ZilNQzAF399CvO8dD8UVEJ0uFZ3MwkfJUPFj+Zm2Q6o/vlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(55016002)(2906002)(8676002)(54906003)(9686003)(4326008)(7696005)(83380400001)(316002)(26005)(186003)(86362001)(6506007)(52536014)(478600001)(76116006)(66446008)(33656002)(5660300002)(71200400001)(966005)(66556008)(66946007)(6916009)(66476007)(8936002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3VOoRndWDwP7r2090wOZoStFFCeWrRs9ZUC12giuCVazDBNaBDUZkoy6Hli+xpof8HkJD+gxM/8rVQTVW+Aw+Vn14r/fyjTQ53h/2Ti98G3TFjfT2SjJz/J1aZKUhVT9WeYZ2cFtUlStWxvrYVhdi2lQxe733DwyLOMRrCLgiGdIfoeumPL1HQpBD5UHIZ/33E5+5nlndapNen7xrqzghfTZfu3EQcMGayACzaouUMOjqGhR728SrZUZw1zuAEZsPn4vQg3ZXXieo0CY0ATevU+w2LbVXy5x/SzKG8U+XXb3At/6J8K3lABm47i6CN0zq9Fq3SZLiNZIYIZWOjpXYYV1FpyLqf4c+PTYzhWMfpi1/n8H6N7FAM7wAk+8B2ILxtIxSyGie0VowK00PKA4d6E6nBssmVqRGtwq7eht4LY1eXEwJH2AdgeJk5VXyGrSxOD9Hpl1OjpEQtxAsGlVGoxFA7/vNcrr3AUjxXk/lrdna6q35feAALeH6AnBf3+6IWJCNC4/cb3KZly0L8FvH/YUkqIda+UDu+cqDQMcFTZoCpKOBkCoCQm8aQ+hH/pO12sBgIkQZOvkQbN8ZsG7yTLD1g8gQA6jCfDCStHnKY1nPKnn0FmcqenN1sw0xbBsCAzedtpHKgyQUWre/zDAng==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e743a9-04af-4298-a29e-08d88001a38b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 14:06:19.8815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eGGvsDThahSKt3r7R9UewkbNEFpnZh1a9fmOHqiSmXNTGhbrQeKeZ2QQ6ZCqh3yShTiNkjxiVqKIOCdcEmWgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3360
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604412382; bh=bNSkykSyIW3MLUjAUR5B3JwzR0H3mYN8m/Vz7H7+Ou8=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=K3LQlM/pNvoxhvtp6dnQTWFPUX6hJ0d5e+78U/wU4XbgKW0qZL7Q5lMSqKRoF+mjp
         pmjfPEQS4FgOVRSHTYGJGujQjlikTvvZqpYxY34isYcowjfq9MPVFbi9HUrOykWo83
         SDmn6L7XL6juieNw0OeBV1cwpVx2O5hDs8PCvmf9qizmRTcbbaRkgRUfPzlYAVQp2Y
         R6l6SJS9Fw4GYLZ1DarRjuIh6LgenGrGbdx6KpfD8NSKQ8NtMXC/rXRiJGQeL+L4Xf
         o3bOisjAhmU3n0GRBvU84THt+XPfWMJGZVkbkWAIVybm7TprJWt8WW4BASqdpJkPLK
         LFowCUW3fPeTg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Wed, 28 Oct 2020 18:55:54 -0400, Khalil Blaiech wrote:
> > Write the devicetree binding text file in schema file, JSON
> > compatible subset of YAML.
> > Besides, add an entry within MAINTAINERS file.
> >
> > Fixes: d9becc53b3ade81e ("dt-bindings: i2c: I2C binding for Mellanox
> BlueField SoC")
> > Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> > Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> > ---
> >  .../bindings/i2c/mellanox,i2c-mlxbf.txt       | 42 ----------
> >  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 78 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 79 insertions(+), 42 deletions(-)
> >  delete mode 100644
> Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> >  create mode 100644
> Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> >
>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml:28:7:
> [warning] wrong indentation: expected 4 but found 6 (indentation)
> ./Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml:31:7:
> [warning] wrong indentation: expected 4 but found 6 (indentation)
>=20
> dtschema/dtc warnings/errors:
>=20
>=20
> See https://patchwork.ozlabs.org/patch/1389582
>=20
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.

Thank you, Rob. Will do.

