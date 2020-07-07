Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F64217A11
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 23:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbgGGVPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 17:15:16 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9965 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728201AbgGGVPQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jul 2020 17:15:16 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f04e5790000>; Tue, 07 Jul 2020 14:13:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 07 Jul 2020 14:15:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 07 Jul 2020 14:15:15 -0700
Received: from [10.2.173.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jul
 2020 21:15:14 +0000
Subject: Re: [RFC PATCH v2 11/18] media: tegra-video: Add support for external
 sensor capture
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <c08ea38f-7629-1800-fb74-a2f75daf2eb0@nvidia.com>
 <47134481-1aec-9c1b-0ed2-8e39158d69b5@nvidia.com>
Message-ID: <3e4a467a-7ef8-7b96-58dd-31c7a834acb7@nvidia.com>
Date:   Tue, 7 Jul 2020 14:15:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <47134481-1aec-9c1b-0ed2-8e39158d69b5@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594156409; bh=UYxjfYM6bnTQ9rahaE5n5SqLSCOzWX15/wpBnNkI5kY=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=MLUWVlBbGnTiKJq4HIq8USESFWh66T39uZXbTMEHnVEzyQkMXqZA3aP5zwezug2UH
         HUfZsXpRNEMK4ZIiaHc6v6fiLkgpqZDIFRCXfo7RZ6L76R0qDkGkDpBxQyIHPC/Sw8
         wfcAWaFRkIqIiG4PMOmDCjlzWtUEJroRzfB7CphiQOdSNbisvop4osnS0ogii3xGc9
         oMQpgsEgdwBz1InT07cg6yjL//vet+WUdP9rblH/iB37iaEGbyn5h9bUHXU+9UctID
         YWp72l/tu+Eiq3qQ2OeZH8qqBFcr1VRl4+hWMOEyot2VCmacYF3G1Tf3iTYght9usq
         VJ00nG4Zgt5Mw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/7/20 1:41 PM, Sowjanya Komatineni wrote:
>
> On 7/7/20 1:29 PM, Sowjanya Komatineni wrote:
>>
>> On 7/7/20 12:35 PM, Hans Verkuil wrote:
>>> On 07/07/2020 21:25, Sowjanya Komatineni wrote:
>>>> On 7/7/20 12:01 PM, Sowjanya Komatineni wrote:
>>>>>
>>>>> On 7/6/20 2:10 AM, Hans Verkuil wrote:
>>>>>>> +static void tegra_vi_graph_cleanup(struct tegra_vi *vi)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 list_for_each_entry(chan, &vi->vi_chans, list) =
{
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video_unregister_device=
(&chan->video);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&chan->video=
_lock);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_queue_release(&chan=
->queue);
>>>>>> No need for this since this is done in vb2_fop_release().
>>>>>>
>>>>>> In fact, vb2_queue_release should never be called by drivers.=20
>>>>>> Just using
>>>>>> vb2_fop_release or __vb2_fop_release is sufficient.
>>>>>>
>>>>>> The confusion is due to the fact that the name suggests that=20
>>>>>> vb2_queue_release
>>>>>> has to be balanced with vb2_queue_init, but that's not the case.=20
>>>>>> Perhaps
>>>>>> vb2_queue_stop or something like that might be a better name.=20
>>>>>> I'll have to
>>>>>> think about this since I see that a lot of drivers do this wrong.
>>>>>>
>>>>>>> + mutex_unlock(&chan->video_lock);
>>>>>>> + v4l2_async_notifier_unregister(&chan->notifier);
>>>>>>> + v4l2_async_notifier_cleanup(&chan->notifier);
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>> +}
>>>>>>> +
>>>>> vb2_queue_release() here is called to stop streaming a head before=20
>>>>> media links are removed in case of when driver unbind happens while
>>>>> userspace application holds video device with active streaming in=20
>>>>> progress.
>>>>>
>>>>> Without vb2_queue_release() here streaming will be active during=20
>>>>> the driver unbind and by the time vb2_queue_release() happens from
>>>>> vb2_fop_release(), async notifiers gets unregistered and media=20
>>>>> links will be removed which causes channel stop stream to crash as=20
>>>>> we can't
>>>>> retrieve sensor subdev=C2=A0 thru media entity pads to execute s_stre=
am=20
>>>>> on subdev.
>>>>>
>>>> I think we don't need async notifier unbind. Currently media links=20
>>>> are removed during unbind so during notifier unregister all subdevs=20
>>>> gets
>>>> unbind and links removed.
>>>>
>>>> media_device_unregister during video device release callback takes=20
>>>> care of media entity unregister and removing links.
>>>>
>>>> So, will try by removing notifier unbind along with removing=20
>>>> vb2_queue_release during cleanup.
>>>>
>>> I actually wonder if vb2_queue_release shouldn't be called from=20
>>> video_unregister_device.
>>>
>>> I'll look into this tomorrow.
>>>
>>> Regards,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0Hans
>>
>> Thanks Hans.
>>
>> Tried without notifier unbind to remove media links and I still see=20
>> crash due to below diff reason now.
>>
>> With userspace app holding video device node with active streaming in=20
>> progress when I do driver unbind, v4l2_device release callback=20
>> tegra_v4l2_dev_release() happens prior to vb2_fops_release() ->=20
>> vb2_queue_release().
>>
>> All channels resources and channel memory is freed during v4l2_device=20
>> release callback.
>>
>> Letting vb2_queue_release() to happen thru vb2_fops_release() causes=20
>> crash as stop streaming tries to retrieve subdev thru channel media=20
>> pads and channel memory is freed by that time.
>>
>> So, doing vb2_queue_release() during driver unbind -> tegra_vi_exit()=20
>> -> tegra_vi_graph_cleanup(), stops subdev stream properly and then on=20
>> v4l2_device release channel memory gets freed and this works which is=20
>> the existing implementation in the patch.
>>
>> I remember adding vb2_queue_release() during graph cleanup for TPG as=20
>> well for the same reason to allow driver unbind while holding video=20
>> device from user space so media pad can be accessible to stop stream=20
>> before channel cleanup.
>
> v4l2_dev release() should definitely happen in the last after=20
> vb2_fops_release(). Will add more debugs and confirm on what I=20
> observed as something happened with timestamps on log on my side so I=20
> doubt my above observation after removing notifier unbind to remove=20
> media links.
>
> Will check and get back..
>
Hi Hans,

Please ignore=C2=A0 above observation on channel cleanup during v4l2_dev=20
release and vb2_fops_release. I misunderstood from timestamps.

Looking into vdev->dev release callback v4l2_device_release(), it=20
unregisters media entity and links gets removed.

So, by the time vb2_queue_release() happen thru vb2_fops_release(),=20
links are removed so subdev can't be retrieve thru media entity pads=20
unless video driver maintains subdev pointers to use them instead of=20
retrieving from media entity pads.

To fix this, instead of maintaining subdev pointers in Tegra video=20
driver channel structure, probably we can leave vb2_queue_release() call=20
to happen during driver unbind graph cleanup which does stream stop=20
where Tegra channel stop stream retrieves subdev thru media pad entities=20
when media links are still present.


Thanks

Sowjanya

>>
>> Regards,
>>
>> Sowjanya
>>
