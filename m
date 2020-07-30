Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FFD232917
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 02:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgG3Apg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 20:45:36 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3597 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgG3Apg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 20:45:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2218020000>; Wed, 29 Jul 2020 17:44:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 17:45:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jul 2020 17:45:36 -0700
Received: from [10.2.160.194] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 00:45:35 +0000
Subject: Re: [RFC PATCH v5 13/14] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-14-git-send-email-skomatineni@nvidia.com>
 <c3d40261-9d77-3634-3e04-f20efad9d3d8@gmail.com>
 <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
 <2ec535c9-55e8-8834-6002-36c75aeb097c@gmail.com>
 <021707b9-5f72-6f8b-d125-43627ef64a6d@nvidia.com>
 <de2d6117-b1e5-14c0-52ca-ff46b444c866@nvidia.com>
 <ca18b93e-1f1c-50ae-e0c1-11758935ee89@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <42f25a49-ad2b-4e52-fd99-cb0f52037988@nvidia.com>
Date:   Wed, 29 Jul 2020 17:52:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca18b93e-1f1c-50ae-e0c1-11758935ee89@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596069890; bh=MEsrOCbBwTTA5kgp+sH036/e7H0sbwi1c+9X8BbcCJ8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=pXbedjbWTlW8O1hyYnXM8BNvkiJ+V7YUGdOzeNJvNAc1SJDvPOCixsM5G0966MIzX
         8b71jfpKGeo1MVJeb3u9JOJPkW+IvJ7kACkrS+q1AJCbrCLMCmh23EPUlICk1txaXd
         P4lAUnRQ01ExORMjCYLxiN8usZc6rwxeONaWhyLMKJPYli6XSiVvU8nUCTf3x8Aq3k
         KWjbIXBUOzJVlxTZQgns/H0GV0GPAQIwZi5i21UN4vuPvk2YLqtFuY9b0QK9JI8TsV
         5BfnDolgBNSWveApimGYPRtLMtBcFY2zI6ADoicLPaDzPDzovzb1vlndSQgRCVz2RF
         wL8ZgtWkhRCKg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/29/20 5:43 PM, Dmitry Osipenko wrote:
> 30.07.2020 03:27, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>>> Secondly, perhaps a failed calibration isn't a very critical error?
>>>> Hence just printing a warning message should be enough.
>>> Using dev_err to report calibration failure. Are you suggesting to use
>>> dev_warn instead of dev_err?
> I meant that failing s_stream might be unnecessary.
>
> The dev_warn should be more appropriate for a non-critical errors.
>
>>>> Could you please make a patch that factors all ON/OFF code paths into =
a
>>>> separate functions? It's a bit difficult to follow the combined code,
>>>> especially partial changes in the patches. Thanks in advance!
>>> what do you mean by partial changes in patches?
>>>
>>> Can you please be more clear?
>> Also please specify what ON/OFF code paths you are referring to when you
>> say to move into separate functions?
> I meant to change all the code like this:
>
> set(on) {
>      if (on) {
>         ...
>         return;
>      }
>
>      if (!on)
>        ...
>
>      return;
> }
>
> to somewhat like this:
>
> set(on) {
>      if (on)
>        ret =3D enable();
>      else
>        ret =3D disable();
>
>      return ret;
> }

You mean to change tegra_channel_set_stream() ?


