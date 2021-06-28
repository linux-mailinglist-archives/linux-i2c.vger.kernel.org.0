Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943CF3B6611
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 17:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237176AbhF1PwX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 11:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235821AbhF1PwT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Jun 2021 11:52:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363A0C0611F9
        for <linux-i2c@vger.kernel.org>; Mon, 28 Jun 2021 08:29:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6F47B8A;
        Mon, 28 Jun 2021 17:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624894184;
        bh=LsaKUfL5dgfHxwHkCU1lj7kPoPO/yuuNuLGKgREO1vc=;
        h=Date:From:To:Cc:Subject:From;
        b=BwpvQ66NufswOwSCbrVq4L6uu1PgRbwM5QnBn9xGcNmveYLDzgYrLOVSGaaQCINMZ
         6UGvawCe3SJgTdZPQAKZKi08+7hp89pdjPyzqzvULHiotZxrq5+GAhZH7WtwTlVr9n
         0IXaxlnJHa187Jvq9BKGLPBsFdibTHJJdVKVwaXY=
Date:   Mon, 28 Jun 2021 18:29:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jose Cazarin <joseespiriki@gmail.com>
Subject: Device match data and DT compatible string fallback
Message-ID: <YNnq5ljCeSbBU7cQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

I recently ran into an issue in a driver (drivers/iio/dac/ti-dac5571.c
to be precise, but the problem is more generic) that led to a crash at
probe time. The driver supports matching to both OF devices and platform
devices by specifying of_device_id and i2c_device_id tables. It supports
multiple devices, and stores device-specific data in the i2c_device_id
table that it retrieves at probe time through the i2c_device_id pointer
passed to the probe function.

The device I'm working with is an DAC081C081, which is compatible with
the DAC5571. It's an OF device that has the compatible property set to

	compatible = "ti,dac081c081", "ti,dac5571";

The driver doesn't support the ti,dac081c081 compatible string, so the
device is matched to the driver using the compatible fallback
"ti,dac5571". This leads to the i2c_device_id passed to the proble
function being NULL, as the i2c_device_if table doesn't contain a
"dac5571" entry, and this results in a crash.

I could fix this in the driver by calling of_device_get_match_data() in
the probe function with dev->of_node is not NULL, but I feel this is
really an issue that should be handled by the framework. Has anyone ever
given it a thought ?

-- 
Regards,

Laurent Pinchart
