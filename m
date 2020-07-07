Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B381C217965
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 22:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgGGU3M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 16:29:12 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8289 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgGGU3L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jul 2020 16:29:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f04db0a0002>; Tue, 07 Jul 2020 13:28:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Jul 2020 13:29:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Jul 2020 13:29:11 -0700
Received: from [10.2.173.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jul
 2020 20:29:10 +0000
Subject: Re: [RFC PATCH v2 11/18] media: tegra-video: Add support for external
 sensor capture
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
 <50deca28-c198-703c-96e2-82c53f48cd65@xs4all.nl>
 <6ee18b4d-b63b-8053-1b7e-c3ec7c1d4956@nvidia.com>
 <6846e5bb-db1d-c2ff-c52c-70a2094c5b50@nvidia.com>
 <af11cb24-57b2-7326-ca29-e168dcbb8006@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c08ea38f-7629-1800-fb74-a2f75daf2eb0@nvidia.com>
Date:   Tue, 7 Jul 2020 13:29:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <af11cb24-57b2-7326-ca29-e168dcbb8006@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594153738; bh=41u0GL5cMfBoVRtx5rywogpG12/ebnA5LHTDhsHfwM4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=qm2gIMJSMkbFfKypTqzi0HUw27rTjlHyza8d8CrVMsdmdz9kZHHbcltBu9kaRPB2l
         RrJ3oWaEmjCZXYx4q/kQ/JWx0uOSBV5hGC68ULq+vq7ToQ8W2XnA22FBZJN935Vllt
         r6+cuvlIs0rdZjTZNP0ptA0CsjtLRZLD+o0Og7oF5Y7cxOPN5we3xZHAwfXriDRT+C
         +Ol5Kr2xuAY3h14mG6XZqAEV3z6PLVYV4eqFg0lMcei0MKIteouiNrdz7NLHO59LxV
         b2OxQpOo58uPSW8S6ykElYzZmOn32HB/dST9WqGV9EoMcCTu0cTFvyM2THDyE0cWcO
         MPHAntPEs3YzQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/7/20 12:35 PM, Hans Verkuil wrote:
> On 07/07/2020 21:25, Sowjanya Komatineni wrote:
>> On 7/7/20 12:01 PM, Sowjanya Komatineni wrote:
>>>
>>> On 7/6/20 2:10 AM, Hans Verkuil wrote:
>>>>> +static void tegra_vi_graph_cleanup(struct tegra_vi *vi)
>>>>> +{
>>>>> +	struct tegra_vi_channel *chan;
>>>>> +
>>>>> +	list_for_each_entry(chan, &vi->vi_chans, list) {
>>>>> +		video_unregister_device(&chan->video);
>>>>> +		mutex_lock(&chan->video_lock);
>>>>> +		vb2_queue_release(&chan->queue);
>>>> No need for this since this is done in vb2_fop_release().
>>>>
>>>> In fact, vb2_queue_release should never be called by drivers. Just usi=
ng
>>>> vb2_fop_release or __vb2_fop_release is sufficient.
>>>>
>>>> The confusion is due to the fact that the name suggests that vb2_queue=
_release
>>>> has to be balanced with vb2_queue_init, but that's not the case. Perha=
ps
>>>> vb2_queue_stop or something like that might be a better name. I'll hav=
e to
>>>> think about this since I see that a lot of drivers do this wrong.
>>>>
>>>>> +		mutex_unlock(&chan->video_lock);
>>>>> +		v4l2_async_notifier_unregister(&chan->notifier);
>>>>> +		v4l2_async_notifier_cleanup(&chan->notifier);
>>>>> +	}
>>>>> +}
>>>>> +
>>> vb2_queue_release() here is called to stop streaming a head before medi=
a links are removed in case of when driver unbind happens while
>>> userspace application holds video device with active streaming in progr=
ess.
>>>
>>> Without vb2_queue_release() here streaming will be active during the dr=
iver unbind and by the time vb2_queue_release() happens from
>>> vb2_fop_release(), async notifiers gets unregistered and media links wi=
ll be removed which causes channel stop stream to crash as we can't
>>> retrieve sensor subdev=C2=A0 thru media entity pads to execute s_stream=
 on subdev.
>>>
>> I think we don't need async notifier unbind. Currently media links are r=
emoved during unbind so during notifier unregister all subdevs gets
>> unbind and links removed.
>>
>> media_device_unregister during video device release callback takes care =
of media entity unregister and removing links.
>>
>> So, will try by removing notifier unbind along with removing vb2_queue_r=
elease during cleanup.
>>
> I actually wonder if vb2_queue_release shouldn't be called from video_unr=
egister_device.
>
> I'll look into this tomorrow.
>
> Regards,
>
> 	Hans

Thanks Hans.

Tried without notifier unbind to remove media links and I still see=20
crash due to below diff reason now.

With userspace app holding video device node with active streaming in=20
progress when I do driver unbind, v4l2_device release callback=20
tegra_v4l2_dev_release() happens prior to vb2_fops_release() ->=20
vb2_queue_release().

All channels resources and channel memory is freed during v4l2_device=20
release callback.

Letting vb2_queue_release() to happen thru vb2_fops_release() causes=20
crash as stop streaming tries to retrieve subdev thru channel media pads=20
and channel memory is freed by that time.

So, doing vb2_queue_release() during driver unbind -> tegra_vi_exit() ->=20
tegra_vi_graph_cleanup(), stops subdev stream properly and then on=20
v4l2_device release channel memory gets freed and this works which is=20
the existing implementation in the patch.

I remember adding vb2_queue_release() during graph cleanup for TPG as=20
well for the same reason to allow driver unbind while holding video=20
device from user space so media pad can be accessible to stop stream=20
before channel cleanup.

Regards,

Sowjanya

