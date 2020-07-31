Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115BD234933
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 18:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732395AbgGaQ3D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 12:29:03 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6851 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgGaQ3D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 12:29:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2446c10003>; Fri, 31 Jul 2020 09:28:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 09:29:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 09:29:03 -0700
Received: from [10.2.167.221] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 16:29:01 +0000
Subject: Re: [RFC PATCH v6 09/10] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <1596186169-18729-10-git-send-email-skomatineni@nvidia.com>
 <3ac158c4-7df7-e3c1-f0e1-33e7ef017762@gmail.com>
 <f483329d-b5fe-fda5-e235-b8edb5fce440@nvidia.com>
 <a08af0e8-80d8-0bd0-87a3-adfc8e70a92a@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ace047fe-8a1a-666a-b91b-9d63b1d68567@nvidia.com>
Date:   Fri, 31 Jul 2020 09:29:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a08af0e8-80d8-0bd0-87a3-adfc8e70a92a@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596212929; bh=wiDX5nyN9UriQ2/ElU4lhyUh5w9DvvpArAoLEITpFZA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=olRW+DlN71dB+r0ZNOxtRhP7eVN9oe0PQG99E0Tx3krlqvqifprFhHGovWplhQ6Za
         ZtLXRDCrT+oX9InUyqXSsnmSJ1juaEt6NcZ1KaeVuvdXUJzePjGgntwVppYeVtAlVD
         UtxaCG2z7ctP6VB/pw8bBoOICNuWi2he91T+snzeTjwkcj7aLkti5WLDW2k9xpPb5j
         X/I+vbrhuaMPjWQavXJwymx/jBRgSz91UI9VTP/X7r20ThmphbM9434TfRXlhPBpdA
         qF6AZCnnzvrYuy5hsp6d44DNzfvfArhqCrdRQ7N0cQmHBJbAxrXcSKFQ3UE7YL2hS3
         M3sC78Kzai0OQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/31/20 9:14 AM, Dmitry Osipenko wrote:
> 31.07.2020 18:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/31/20 4:39 AM, Dmitry Osipenko wrote:
>>> 31.07.2020 12:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> @@ -249,13 +249,47 @@ static int tegra_csi_enable_stream(struct
>>>> v4l2_subdev *subdev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 if (csi_chan->mipi) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_mipi_enable(=
csi_chan->mipi);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(csi->dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "failed to enable MIPI pads: %d\n", ret);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to rpm_put;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * CSI MIPI pads PULL=
UP, PULLDN and TERM impedances need to
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * be calibrated afte=
r power on.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * So, trigger the ca=
libration start here and results will
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * be latched and app=
lied to the pads when link is in LP11
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * state during start=
 of sensor streaming.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_mipi_start_c=
alibration(csi_chan->mipi);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(csi->dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "failed to start MIPI calibration: %d\n", ret);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to disable_mipi;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> What would happen if CSI stream is enabled and then immediately disable=
d
>>> without enabling camera sensor?
>> Nothing will happen as during stream enable csi receiver is kept ready.
>>
>> But actual capture will not happen during that point.
> Could you please show how the full call chain looks like? It's not clear
> to me what keeps CSI stream "ready".

VI is the main video input (video device) and on streaming it starts=20
stream of CSI subdev prior to stream of Sensor.

HW path, sensor stream (CSI TX) -> CSI stream (RX)

During CSI stream on, CSI PHY receiver is enabled to start receiving the=20
data but internally capture assembled to active state will happen only=20
when Tegra VI single shot is issues where VI thru pixel parser gets=20
captures data into the memory


