Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF772156B8
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jul 2020 13:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbgGFLwb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jul 2020 07:52:31 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41455 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728414AbgGFLwa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jul 2020 07:52:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sPd3j8eCUBncFsPd6jvGUZ; Mon, 06 Jul 2020 13:52:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594036348; bh=wPbqN09DUqoq1F6TV85LI76gqa+lhk27jZ43aOotfmw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pt6KGDZPMi8JHPbVsMr0qe2IlMQlR/cGG9kI0wp2jVT5AGFe3FW280LMEP5HVUxkr
         sOv7a2KzWpKuZ3wgkY2mX8qBc9ZNPPyXU+ZnR0UNyDXL/MSxVGWhNcSORItQpxGIoV
         tXtHxZq2XaSXILwyTSFuCwsi8EDyE5HgazW7H+MKfdmUYyS1I33zMcHrjns22+STCx
         CrqKSfQxljDD58PIfKKNkM6Pp/FOORSjzKO4wIo7U91cWfd3nrcOjYTJ4CeD4DP5+9
         qbUrEuUVphbrpP5YJ2U1eBSFbYkfQ2z07LyeOs/ZxXzo5eJDqoSZUWsHkwwrcEt7DA
         5gfh8nQsrNYww==
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0e25a523-c911-0973-65ba-49883d2383fd@xs4all.nl>
Date:   Mon, 6 Jul 2020 13:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMhGvfNQdbbFSvkix5vSPRd+I8BouJ5k7sjraltxZCW/i73BR+XvWsWG+LK/vagCGbnhHotLMqr7F12wUckqW2dDCYLI1WjfHwU6T8z58+I7/c5DSW5r
 GsZmRBk42bFNWH4byB0XAEw258h1xft3GbFKph8J+gb/EvKy3BgizZLARAEMNkSSO+1RL9vyT137dmsk+pdPontXZVNdRYfzWfhgFNAvRNz9vUJ0OLgjkBiL
 G0nA+IBDdLhdfZjysqQRJHZ0/VXWEc4ph+3wVmVOw5Xsi169OoU03m77VXdcA1nL5rMee0ZglYEHGYXmHuJMSPraRPPWel1PqshRUNzFaKJcqumHFbIZNuez
 IuXF1Crcj5rQyLzirwWZu41R4AlAD70ccmumPb3K+DQeYeuABYWJXk0cmb3G0QzEG5rMVHM600wWN7jYbxFIOgsCjSmdMCR2w9IjDf5CKS4n4kN8w1xUsH/g
 otxL1TDD7cKOw2YG9SJ+3Li/lquKUK9TWYRceMo3Kx54gzk66kIhHkb2qRPbbkV20lfzOy1+AvWCvkR5Ikf7DMjjSmGUX+dPSxwnZYtSqHNR0SsTOq6N6I8O
 /MpQJ31ZAAYlUsE0B2t2UMHZgqWPcS1uSk/qC/P6krIqArn+P2yPxq8zG2SdxS+r2mLGG37xf4+iJrFer+yVVUDG
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/06/2020 03:41, Sowjanya Komatineni wrote:
> This patch adds support to capture from the external sensor
> based on device graph in the device tree.
> 
> Driver walks through the device graph to create media links
> between the entities and registers and unregisters video devices
> when the corresponding sub-devices are bound and unbound.
> 
> Channel formats are enumerated based on available formats from
> the sensor and the corresponding matched formats from the Tegra
> supported video formats list.
> 
> Each Tegra CSI instance can be configured as 4-lane or 2-lane
> based on supported lane configuration from the sensor through
> the device tree.
> 
> Currently this driver supports V4L2 video node centric only.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/tegra-video/Kconfig    |   1 +
>  drivers/staging/media/tegra-video/csi.c      | 128 +++++-
>  drivers/staging/media/tegra-video/csi.h      |   1 +
>  drivers/staging/media/tegra-video/tegra210.c |   2 +-
>  drivers/staging/media/tegra-video/vi.c       | 623 +++++++++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h       |  23 +-
>  6 files changed, 726 insertions(+), 52 deletions(-)
> 

<snip>

> +static int tegra_csi_channels_alloc(struct tegra_csi *csi)
> +{
> +	struct device_node *node = csi->dev->of_node;
> +	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };

A bus_type value of 0 is deprecated, this should be set to a valid
bus_type (probably V4L2_MBUS_CSI2_DPHY).

Regards,

	Hans
