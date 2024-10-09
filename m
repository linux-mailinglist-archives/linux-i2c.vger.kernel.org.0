Return-Path: <linux-i2c+bounces-7300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B49996B7D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 15:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53AF11F22CDA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD38196D98;
	Wed,  9 Oct 2024 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WI0sVayc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56932291E;
	Wed,  9 Oct 2024 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479673; cv=none; b=apr2C+vhmbZwswFjUiiLZjE6r5TkWlxQaGbN+gcqJRhGAi7dCb2w9Ynx//VKXBP0jrlAQS584jElRaj3xBtJoqfGxlM1BBQRBfUwFIgOkM27nL3oAuggrOBDP8yRNNGpmIOlVrV9NAzhqwtVGTuGukBtAsqbYeIwGLI3ufXe8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479673; c=relaxed/simple;
	bh=YINrfZsek2PYwQzx5aXAqFR5N5hGjnKx66rviiTj1Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YS+pyLemzjnTE0fRNtxOYrvsSJrTgTwoEqEfmDpAs25sPM+Gw0CmKDxQSPZV1qOE0jbHEPigc8EWFjta6r0kKFRH5SkUQHJRpord6nveTPWGGNOIdpiTLN12Qvva2BTb25b/AKxInxhdxmzn5JsWFy0WdR3eejWUfkmKugUlOnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WI0sVayc; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994xc0x003245;
	Wed, 9 Oct 2024 07:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b9CbWLDMZti2ojgRTihH3RA0WYLUzEcG7aX6pdihoQY=; b=
	WI0sVaycTZYkwMgmtYcXXMdvigsiua8Ix4Qh02mNCGH2fBXcoCmYBNNsEO5BXVde
	1Bz9WSIl3H9aytV4MjeLGq5iNgl4nMnifXKD7gZBG7Nh0M0RDNAmEax34ZlRrQpc
	BqxwXp6rQsj7d8HBI3neZNecBDiZiUXrqk9SjO/XH7GSP3KBa0vc3lo3Nh2evgTs
	vMpU/eouIhXwHQgJkPlVYadHgMk2W3tKDA7WeoPiKLk9i2DcqwNiAeCbgFtNS1E3
	D/03y3ryRn8KcZ7U0bo3WMxdHCmB9tG9qfIm/V0gyX7oGE/Hh+fOgbX3EkFod4UH
	WWLlkgIPTShr+Vylj7CyYA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy5xfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:48:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 13:48:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 13:48:15 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 33C5E82024A;
	Wed,  9 Oct 2024 12:48:15 +0000 (UTC)
Message-ID: <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
Date: Wed, 9 Oct 2024 13:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
        <nouveau@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-i3c@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <iommu@lists.linux.dev>, <imx@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-pwm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <linux-usb@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <greybus-dev@lists.linaro.org>,
        <asahi@lists.linux.dev>, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
 <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ltWPFp1gnPUjzPmaRQ9EaXCq91PhMVjU
X-Proofpoint-ORIG-GUID: ltWPFp1gnPUjzPmaRQ9EaXCq91PhMVjU
X-Proofpoint-Spam-Reason: safe

On 08/10/2024 7:24 pm, Rafael J. Wysocki wrote:
> On Tue, Oct 8, 2024 at 12:35 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>>
>> On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com> wrote:
>>>
>>> Hi Ulf,
>>>
>>> On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
>>>> On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
>>>>> On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
>>>>>> On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
>>>>>>>
>>>>>>> Hello everyone,
>>>>>>>
>>>>>>> This set will switch the users of pm_runtime_put_autosuspend() to
>>>>>>> __pm_runtime_put_autosuspend() while the former will soon be re-purposed
>>>>>>> to include a call to pm_runtime_mark_last_busy(). The two are almost
>>>>>>> always used together, apart from bugs which are likely common. Going
>>>>>>> forward, most new users should be using pm_runtime_put_autosuspend().
>>>>>>>
>>>>>>> Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
>>>>>>> I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
>>>>>>> and pm_runtime_mark_last_busy().
>>>>>>
>>>>>> That sounds like it could cause a lot of churns.
>>>>>>
>>>>>> Why not add a new helper function that does the
>>>>>> pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
>>>>>> things? Then we can start moving users over to this new interface,
>>>>>> rather than having this intermediate step?
>>>>>
>>>>> I think the API would be nicer if we used the shortest and simplest
>>>>> function names for the most common use cases. Following
>>>>> pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
>>>>> most common use case. That's why I like Sakari's approach of repurposing
>>>>> pm_runtime_put_autosuspend(), and introducing
>>>>> __pm_runtime_put_autosuspend() for the odd cases where
>>>>> pm_runtime_mark_last_busy() shouldn't be called.
>>>>
>>>> Okay, so the reason for this approach is because we couldn't find a
>>>> short and descriptive name that could be used in favor of
>>>> pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
>>>> you like it - or not. :-)
>>>
>>> I like the idea at least :-)
>>>
>>>> I don't know what options you guys discussed, but to me the entire
>>>> "autosuspend"-suffix isn't really that necessary in my opinion. There
>>>> are more ways than calling pm_runtime_put_autosuspend() that triggers
>>>> us to use the RPM_AUTO flag for rpm_suspend(). For example, just
>>>> calling pm_runtime_put() has the similar effect.
>>>
>>> To be honest, I'm lost there. pm_runtime_put() calls
>>> __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
>>> pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
>>> RPM_ASYNC | RPM_AUTO).
>>
>> __pm_runtime_idle() ends up calling rpm_idle(), which may call
>> rpm_suspend() - if it succeeds to idle the device. In that case, it
>> tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
>> to what is happening when calling pm_runtime_put_autosuspend().
> 
> Right.
> 
> For almost everybody, except for a small bunch of drivers that
> actually have a .runtime_idle() callback, pm_runtime_put() is
> literally equivalent to pm_runtime_put_autosuspend().
> 
> So really the question is why anyone who doesn't provide a
> .runtime_idle() callback bothers with using this special
> pm_runtime_put_autosuspend() thing,

Because they are following the documentation? It says:

"Drivers should call pm_runtime_mark_last_busy() to update this field
after carrying out I/O, typically just before calling
pm_runtime_put_autosuspend()."

and

"In order to use autosuspend, subsystems or drivers must call
pm_runtime_use_autosuspend() (...), and thereafter they should use the
various `*_autosuspend()` helper functions instead of the non#
autosuspend counterparts"

So the documentation says I should be using pm_runtime_put_autosuspend()
instead of pm_runtime_put().

Seems unfair to criticise people for following the documentation.


