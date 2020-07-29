Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328772323AF
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jul 2020 19:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgG2RsP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 13:48:15 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13637 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgG2RsN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 13:48:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f21b6300000>; Wed, 29 Jul 2020 10:47:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 10:48:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jul 2020 10:48:13 -0700
Received: from [10.2.160.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jul
 2020 17:48:12 +0000
Subject: Re: [RFC PATCH v5 12/14] gpu: host1x: mipi: Keep MIPI clock enabled
 till calibration is done
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-13-git-send-email-skomatineni@nvidia.com>
 <b21e3227-d0d8-5b4a-ae69-aa29551a22c3@gmail.com>
 <69903c67-8e5f-11c2-45ec-c76b97634aba@nvidia.com>
 <d291d306-55d4-2264-dc05-0e47f0dfef20@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b5fcc292-8ce3-2833-491f-5aefbe0196eb@nvidia.com>
Date:   Wed, 29 Jul 2020 10:55:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d291d306-55d4-2264-dc05-0e47f0dfef20@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596044848; bh=WlqRhgzgQcue/GR0Zrfuhfw08PXoX9nLL9Uz68gPB6A=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=J0L2YvLfggXNKWADlDM+eCasPdwHDhj8F+Z6cwBwODvdJFoV2n8lYuQcuHfyfzvUI
         vnkhEBtuw+vWMyAF5+squmzJmLFqetZTUqbj9XcubCnkZGgRAI22Cpshh0PgJr1il5
         BS8yGVHJM2i7Ibvw+OwrI+UyEQsHCcLl+sbtVzD9yBzXx2YxMKm3tJ6jn5V97/7SAQ
         vZNkq66AKKSMpA5j83S0TAxvj/jHoMnTo8YyqI32pJieVruFYA5jQMR/f2To1qqrW3
         26SAa+IKuSI3+ub8djJ3wryyw44LszGsqF9ZKOyZqfOgNPGE/gMI60Lorswa7s2Ohl
         s+EUOh1AfxNOQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/29/20 10:08 AM, Dmitry Osipenko wrote:
> 28.07.2020 19:04, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>>>> +{
>>> Doesn't MIPI_CAL need to be reset here?
>> No need to reset MIPI CAL
> Could you please explain why. There is a calibration state-machine that
> apparently needs to be returned into initial state, does it return by
> itself?
>
> TRM says that MIPI block needs to be reset before of starting
> calibration process. The reset is completely missing in the driver, I
> assume it needs to be corrected with another patch.

TRM documented incorrectly. There is no need to reset MIPI_CAL.

MIPI CAL is FSM and it does not hang and done bit is to indicate if=20
results are applied to pads or not.

If we don't see done bit set meaning, MIPI CAL did not see LP-11 and=20
results are not applied to pads.

Also while multiple streams can happen in parallel and we can't reset=20
MIPI CAL as other CSI channel streams (using other pads) may also be=20
going thru calibration process in parallel depending and also DSI pads=20
also are calibrated thru same MIPI CAL controller.


