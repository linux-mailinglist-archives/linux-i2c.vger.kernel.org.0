Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6951217802
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 21:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgGGTfU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 15:35:20 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33185 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726805AbgGGTfT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jul 2020 15:35:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id stN2jdgqMudYLstN5jGBlk; Tue, 07 Jul 2020 21:35:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594150516; bh=UOPB1MiDbf2BNt8huZ0O3vNz4hwNVClrWHPizzmlF6U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TpFD7cKY6Hc/29uAfk2e1LQcauw9XVNA3Y0xQcxRHpGmKEESaSC+9GLnz7zNeOA5v
         AIvLXXDIiH+oqOZ9Lsy34a3NlYZaCJrqLaBF85W8IkJcSdwp0JdIVdW9r6Un5XWnXw
         sAuI1ILMgBDSQCssXNJXdqjddwAd4oAuMX6eZldxgKFJ3lTHiBC0C7QQwzWcdG2xK/
         3OZvQCj7d9wtTKuD8LYkGt9wy4avseaSBe2my61TxZ8wysZqcEmNT67lTIxvpZDMRf
         FHikiise4P4oBwYQ1uVCGDDPh8Qcov2bYhcV8d+6EuDOE5XMW+JyBNUXt8W7DiZ1ds
         0Y2eURCC1bd3w==
Subject: Re: [RFC PATCH v2 11/18] media: tegra-video: Add support for external
 sensor capture
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
 <50deca28-c198-703c-96e2-82c53f48cd65@xs4all.nl>
 <6ee18b4d-b63b-8053-1b7e-c3ec7c1d4956@nvidia.com>
 <6846e5bb-db1d-c2ff-c52c-70a2094c5b50@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <af11cb24-57b2-7326-ca29-e168dcbb8006@xs4all.nl>
Date:   Tue, 7 Jul 2020 21:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6846e5bb-db1d-c2ff-c52c-70a2094c5b50@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEbKQ3MlxCTk+8kIzmdPmM9lsK3d2NWLAz8lS/LdblDynfg33nR4irTd97JEL1AAPqUF3Ry/Saa3Zn45IMAxwA7KFqlZ8xch9juTFQzB/8WZisg8h463
 ByFDJTrjCK5kf6QSaNpQjcCNZ94yl+uaBRnWV/5J2UEclZBPnN3rQ9w3aNpSrxy4nkjQC6UDcSLrmm8PO/fHx7RRy/eKteBwJlyDT/EuUEK/1jcixSGARCeG
 /3csdj7NYjZobrOgekpYl7XK7W2z6qso/HZJkCloxjFyjL6jrsihCVpzjFMDIvEwx1/yVY96GMcYI/WMNfBcKe+Oew5sAJji0BLV1zHu2RYOvem49Fzjbiq4
 ubNz6unUPQTq05a7Wjp4pdF76pjqKaP/ctzW8f4dkCic7QdsU2SCDVtGlyaA+iSg5OSTM1qnFkn89rjudpUAoUPgAFGbd83cOYC3V9lX9gXjfrWorHgFaeL5
 YXqMf+hH2kUah4wUjenKI8NLcX39C1erUNClXs3VH37tfr0ch6AHmwY2d/y266Jd7i3+aEdZP3Jz+I0ap/Q7k1rqFeVE3rkX5gwetNZixsYIkO0L3H5bIxk5
 6ylMQ3awwEoh6TzbxCcc26+YpHYOQLSzMjUTt4/GOT++a20CmOEUsmkxfc4cBIDuLqK931We0WC8jHSQ4iQvWJ2q
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/07/2020 21:25, Sowjanya Komatineni wrote:
> 
> On 7/7/20 12:01 PM, Sowjanya Komatineni wrote:
>>
>>
>> On 7/6/20 2:10 AM, Hans Verkuil wrote:
>>>> +static void tegra_vi_graph_cleanup(struct tegra_vi *vi)
>>>> +{
>>>> +	struct tegra_vi_channel *chan;
>>>> +
>>>> +	list_for_each_entry(chan, &vi->vi_chans, list) {
>>>> +		video_unregister_device(&chan->video);
>>>> +		mutex_lock(&chan->video_lock);
>>>> +		vb2_queue_release(&chan->queue);
>>> No need for this since this is done in vb2_fop_release().
>>>
>>> In fact, vb2_queue_release should never be called by drivers. Just using
>>> vb2_fop_release or __vb2_fop_release is sufficient.
>>>
>>> The confusion is due to the fact that the name suggests that vb2_queue_release
>>> has to be balanced with vb2_queue_init, but that's not the case. Perhaps
>>> vb2_queue_stop or something like that might be a better name. I'll have to
>>> think about this since I see that a lot of drivers do this wrong.
>>>
>>>> +		mutex_unlock(&chan->video_lock);
>>>> +		v4l2_async_notifier_unregister(&chan->notifier);
>>>> +		v4l2_async_notifier_cleanup(&chan->notifier);
>>>> +	}
>>>> +}
>>>> +
>>
>> vb2_queue_release() here is called to stop streaming a head before media links are removed in case of when driver unbind happens while
>> userspace application holds video device with active streaming in progress.
>>
>> Without vb2_queue_release() here streaming will be active during the driver unbind and by the time vb2_queue_release() happens from
>> vb2_fop_release(), async notifiers gets unregistered and media links will be removed which causes channel stop stream to crash as we can't
>> retrieve sensor subdev  thru media entity pads to execute s_stream on subdev.
>>
> I think we don't need async notifier unbind. Currently media links are removed during unbind so during notifier unregister all subdevs gets
> unbind and links removed.
> 
> media_device_unregister during video device release callback takes care of media entity unregister and removing links.
> 
> So, will try by removing notifier unbind along with removing vb2_queue_release during cleanup.
> 

I actually wonder if vb2_queue_release shouldn't be called from video_unregister_device.

I'll look into this tomorrow.

Regards,

	Hans
