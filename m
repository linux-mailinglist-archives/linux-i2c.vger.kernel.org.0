Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E342F216989
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 11:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgGGJvh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 05:51:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53993 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727989AbgGGJvg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jul 2020 05:51:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id skG9ja2t7udYLskGCjDpn8; Tue, 07 Jul 2020 11:51:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594115494; bh=wrW2ndMvRf9746t4gTaXirXlMPYiGUkGLJPp8M560NU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EJLYmExNdtwef0n2X4Oy/yBqwa+9+mStjwO1ogiCb1hlNRFJ732xldEH9FipyaKKO
         wcrB0KOOF3HkuyHvSa/Ti0EuveBF2NnSi5rzo+RwSQDZsnIlbgudmIvd3rjzFhnTp0
         M4lKD2P5Gf0tKQuD6jLsRtmo1LvRChlwrI4VXMdyNPXys3nI6th2ycfAXNXwoiMHzg
         VcWcMnMi1GhyuXlQMCQbXIiiNQhEGoRI1yn1RCZXgmzMX5QMyMOxDTwuHo1GJpiipt
         JMum+uf/NWg9mteUD2VrrOS0zYppV4xBKBORcwbTE3DjpRHKpU3W1S417iQ+KlS7xq
         KEhc0t2IJhu2Q==
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
 <6e09f5d3-85ca-5bf9-8617-b9c8bec36615@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <64622861-c9e7-c158-a2c3-0db8c65fd29f@xs4all.nl>
Date:   Tue, 7 Jul 2020 11:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6e09f5d3-85ca-5bf9-8617-b9c8bec36615@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHR4Jx+ft4syIU+8bWlQadLr1VYDvYjXsOTuMjwrrwYY2Kz3r4xjX0PLOJfK5CxGpHbXMGybg/CVIFRxxmqO9Cr21dX7AhNAWoXHB61FF0YuSAMEyecw
 fj8OO2eZCOdhU6DRzs7MknM2mkeJBZpZZW9fsGD8Iw0vGAAhFG1NPFfzTgfF0GDBXa1XqlKwIokMUAhgxZqPq6HA8FO3wTP0oWi8vxUifQYibHu8QUiz9mC7
 HJF8SUnS3vP1WH6pA5TEHAwIced3F0YPGH2qM9IGyjKsur0h8ZfGpI6dXg9sySexTK905aCYnCDMWT89uWKkNjEJVpa0GVReCDG5i8N3qLcGXUtNTPjFUzw+
 Av1ChQzesb8gJMFDv+sU1EUc/NAAs+8BoJha7d6Zc76yFbod/+MCryRq5vJM2eCEpIPXApsshy0WtFi76MHo1Q1VhKkAimY7ePAEtBxvKF9w871mORaysguR
 dBn5XaXhG2WPwD4wjYkcZ0QVJQQKQGuFH1vux2s3/NAFCDesDKXDTlaFSxRWxIt7pwupXIdNkDpJ9eJegttdlUge9wQqAG00+jpiAvxUnRZFuEu6qG4NMMfu
 PzZIgyZG68UY1eM1SlKiU8COeEmVfUal0u/X+94pr2uIMEXZQVhgdatzZIQPQI1PhC85oUAhSYks6dSeaMPdnvb1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/07/2020 11:40, Sowjanya Komatineni wrote:
> 
> On 7/6/20 2:10 AM, Hans Verkuil wrote:
>>> +static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>>> +{
>>> +	struct tegra_vi_graph_entity *entity;
>>> +	struct v4l2_async_subdev *asd;
>>> +	struct v4l2_subdev *subdev;
>>> +	struct tegra_vi_channel *chan;
>>> +	struct tegra_vi *vi;
>>> +	int ret;
>>> +
>>> +	chan = container_of(notifier, struct tegra_vi_channel, notifier);
>>> +	vi = chan->vi;
>>> +
>>> +	dev_dbg(vi->dev, "notify complete, all subdevs registered\n");
>>> +
>>> +	ret = video_register_device(&chan->video, VFL_TYPE_VIDEO, -1);
>> This should be done last after the tegra_vi_graph_build and tegra_channel_setup_ctrl_handler
>> calls. The video device is immediately accessible after this call, so don't
>> call it until everything is setup (i.e. until just before the 'return 0;' below).
>>
>>> +	if (ret < 0) {
>>> +		dev_err(vi->dev,
>>> +			"failed to register video device: %d\n", ret);
>>> +		goto unregister_video;
>>> +	}
>>> +
>>> +	/* create links between the entities */
>>> +	list_for_each_entry(asd, &chan->notifier.asd_list, asd_list) {
>>> +		entity = to_tegra_vi_graph_entity(asd);
>>> +		ret = tegra_vi_graph_build(chan, entity);
>>> +		if (ret < 0)
>>> +			goto unregister_video;
>>> +	}
>>> +
> Hi Hans,
> 
> Currently Tegra video driver sets v4l2_dev->mdev prior to graph parse and building links to let media_device_register_entity() to happen
> during video_register_device() -> video_register_media_controller() and media_device_unregister_entity() to happen during v4l2_device_release()
> 
> TPG also does the same of letting media entity register/unregister to happen during video device register and release callback.
> 
> So, registering video device prior to media links creation as media_device_register_entity() will happen during video_register_device()
> 
> To register video device after creating media links, it need to change for both TPG and Non-TPG to not set v4l2_dev->mdev and Tegra video
> driver should explicitly take care of media_device_register_entity() and media_device_unregister_entity().
> 
> Prior to making this change to both TPG and Non-TPG, would like to understand on possibility of using video device node prior to finishing
> complete driver probe()
> 
> As video device register happens during async notifier complete callback, and all the device graph build happens during video driver probe()
> what exactly will be the issue of having video device node prior to creating media links?

It's not the 'create links between the entities' bit that's the problem, it is what follows:

+	ret = tegra_channel_setup_ctrl_handler(chan);
+	if (ret < 0) {
+		dev_err(vi->dev,
+			"failed to setup channel controls: %d\n", ret);
+		goto unregister_video;
+	}
+
+	vi_fmts_bitmap_init(chan);
+	subdev = tegra_channel_get_remote_subdev(chan, false);
+	v4l2_set_subdev_hostdata(subdev, chan);

That should be done before the video_register_device call.

Because otherwise the /dev/videoX doesn't have the full set of controls, and
I am also not certain which ioctls might use the subdev hostdata.

The core problem is really that video_register_device should have been split
into an init function and a register function, so it is possible to set
everything up before registering the video device. Oh well...

Regards,

	Hans

> 
> I see some other drivers also doing the same order of registering video device prior to creating media links and also we are doing the same
> in L4T driver as well.
> 
> Thanks
> 
> Sowjanya
> 
> 

