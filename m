Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CB71F5D93
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 23:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgFJVLw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 17:11:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13680 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgFJVLw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 17:11:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee14c6a0001>; Wed, 10 Jun 2020 14:11:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 10 Jun 2020 14:11:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 10 Jun 2020 14:11:51 -0700
Received: from [10.2.167.70] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 21:11:51 +0000
Subject: Re: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI port
 nodes
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
 <20200610112303.GB805@valkosipuli.retiisi.org.uk>
 <075d9d2e-eaa8-1895-8759-64c682fee1c4@nvidia.com>
Message-ID: <d0c7a45a-2d84-7f6c-b1dd-496098f91c49@nvidia.com>
Date:   Wed, 10 Jun 2020 14:11:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <075d9d2e-eaa8-1895-8759-64c682fee1c4@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591823466; bh=vH/jgds5BYy9bydBB1nepGXp1g7humjmHg9RLWhprus=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=pmH/DhOKmrrcBVI/KQKqnT9QkOSBstwEzJBuxf6JCD7G7AtkmBpJcExVLC5PEZmdn
         pHP2tke8qC4ZOPfmH9XpvAO+hGBKPmyxWqXzE1vBEQDsu+Nbdxjd8+pgFB/xgl8CrZ
         Napc26gyyIXZEvMMeXLyaiOCtkDdZELD7xJWTQwhtv/kCp0ZhOcjEDBjTJWGkBLWAa
         FVjWGLplVxus8/mRuhs9Dn0/0QmiKitHtuXYgs3peyj1dXlsTITD09QergXHKLZbj9
         0vDHIQkIHRr1lt3BhZW5VofeAuLrpSnRvpBLTKnhbJfyFUwIObPFfcFGbV9eA+MWLI
         0m6vlcn6X2mzw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/10/20 8:15 AM, Sowjanya Komatineni wrote:
>
> On 6/10/20 4:23 AM, Sakari Ailus wrote:
>> Hi Sowjanya,
>>
>> Thanks for the patchset.
>>
>> On Tue, Jun 09, 2020 at 11:02:32PM -0700, Sowjanya Komatineni wrote:
>>> This patch documents Tegra VI and CSI port and endpoint nodes along
>>> with the other required properties.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>> =C2=A0 .../display/tegra/nvidia,tegra20-host1x.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 87=20
>>> ++++++++++++++++++++++
>>> =C2=A0 1 file changed, 87 insertions(+)
>>>
>>> diff --git=20
>>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x=
.txt=20
>>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x=
.txt=20
>>>
>>> index 4731921..f70a838 100644
>>> ---=20
>>> a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x=
.txt
>>> +++=20
>>> b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x=
.txt
>>> @@ -65,6 +65,48 @@ of the following host1x client modules:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - power-domains: Must includ=
e sor powergate node as csicil=20
>>> is in
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SOR partition.
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Optional properties for csi node=
:
>> What hardware does the csi node represent? A CSI-2 receiver? Something
>> else?
>>
>> If you have two connections, you need two ports. The example isn't quite
>> clear on this; it would appear to represent a single physical interface.
>
> CS-2 receiver with 2 connections. one for sink with sensor to csi and=20
> other as source with csi to Tegra vi.
>
> Was using separate port for sink and source and then I misunderstood=20
> device graph document and changed to have multiple endpoints in same=20
> port.
>
> Will update this in v2 to have separate port for each sink and source=20
> endpoint in csi in dt and also in driver implementation.
>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - channel nodes: Max upto 6 channels/st=
reams are supported=20
>>> with each CSI
>>> +=C2=A0=C2=A0=C2=A0 brick can as either x4 or x2 based on hw connectivi=
ty to sensor.
>>> +
>>> +=C2=A0=C2=A0=C2=A0 Required properties:
>>> +=C2=A0=C2=A0=C2=A0 - reg: channel/stream index
>>> +=C2=A0=C2=A0=C2=A0 - nvidia,mipi-calibrate: Should contain a phandle a=
nd a specifier
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specifying which pads are used by this =
CSI port and need to be
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 calibrated. See also ../display/tegra/n=
vidia,tegra114-mipi.txt.
>>> +
>>> +=C2=A0=C2=A0=C2=A0 - port: CSI port node and its endpoint nodes as per=
 device graph
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings define=
d in=20
>>> Documentation/devicetree/bindings/graph.txt.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Required properties:
>> You have both properties and nodes here. Same for the above (port is a
>> node).
> Will update document to separate out port node from properties
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reg: csi port index based on hw csi l=
anes connectivity to the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sensor.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - bus-width: number of lanes used by th=
is port. Supported lanes
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are 1/2/4.
>> bus-width belongs to the endpoint. Note that this is for parallel busses
>> only. If you need the number of lanes, the property is called=20
>> data-lanes.
> Will update in v2 for having separate ports for sink and source=20
> endpoints will move bus-width to endpoint.
Thanks Sakari. Will switch to use data-lanes property in csi ports end=20
points in v2.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - endpoint@0: sink node
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Required properties:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reg: endpoint id. This is=
 used to retrieve pad for creating
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media link
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - remote-endpoint: phandle =
to sensor endpoint
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - endpoint@1: source node
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reg: endpoint id. This is=
 used to retrieve pad for creating
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media link
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - remote-endpoint: phandle =
to vi port endpoint
>>> +
>>> +=C2=A0 Optional properties for vi node:
>>> +=C2=A0 - ports: Video port nodes and endpoint nodes as per device grap=
h=20
>>> bindings
>>> +=C2=A0=C2=A0=C2=A0 defined in Documentation/devicetree/bindings/graph.=
txt
>>> +=C2=A0=C2=A0=C2=A0 Max 6 ports are supported and each port should have=
 one=20
>>> endpoint node.
>>> +
>>> +=C2=A0=C2=A0=C2=A0 Required properties:
>>> +=C2=A0=C2=A0=C2=A0 - port: VI port node and its sink endpoint node
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Required properties:
>>> +=C2=A0=C2=A0=C2=A0 - reg: should match port index
>>> +=C2=A0=C2=A0=C2=A0 - endpoint@0: sink node
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Required properties:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reg: endpoint id must be 0
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - remote-endpoint: phandle to CSI endpo=
int node.
>>> +
>>> =C2=A0 - epp: encoder pre-processor
>>> =C2=A0 =C2=A0=C2=A0=C2=A0 Required properties:
>>> @@ -340,6 +382,22 @@ Example:
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ranges =3D <0x0 0x0 0x54080000 0x2000>;
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ports {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 port@0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx219_vi_in0: endpoint@0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remot=
e-endpoint =3D <&imx219_csi_out0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 csi@838 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "nvidia,tegra210-csi";
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x838 0x1300>;
>>> @@ -362,6 +420,35 @@ Example:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&tegra_car=
 TEGRA210_CLK_CSI_TPG>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D "csi", "cilab", "cilcd", =
"cile",=20
>>> "csi_tpg";
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains =3D <&pd_sor>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 channel@0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvidia,mipi-calibrate =3D <&m=
ipi 0x001>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bus-w=
idth =3D <2>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #addr=
ess-cells =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size=
-cells =3D <0>;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx21=
9_csi_in0: endpoint@0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&imx219_out0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx21=
9_csi_out0: endpoint@1 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&imx219_vi_in0>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 };
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 };
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
