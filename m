Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE24195BCE
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 18:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgC0RDr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 13:03:47 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:52188 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgC0RDr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 13:03:47 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 38CC780618;
        Fri, 27 Mar 2020 18:03:44 +0100 (CET)
Date:   Fri, 27 Mar 2020 18:03:42 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
Message-ID: <20200327170342.GA5572@ravnborg.org>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
 <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
 <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
 <20200327152535.GA2191@ravnborg.org>
 <CADnq5_O-pXK1FeT1NfGBdXYZbqF6jmyXJNPgJt5qLaYMLiZy_Q@mail.gmail.com>
 <20200327154509.GB3971@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327154509.GB3971@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LDBv8-xUAAAA:8
        a=zd2uoN0lAAAA:8 a=jdWeosqewm8peECdMA0A:9 a=CjuIK1q_8ugA:10
        a=DZeXCJrVpAJBw65Qk4Ds:22
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 27, 2020 at 04:45:09PM +0100, Wolfram Sang wrote:
> 
> > > > > Move away from the deprecated API.
> > > > >
> > > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > >
> > > > patches 1,6, are:
> > > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > > Should we commit all to drm-misc-next?
> > 
> > I'm fine to see it go through whatever tree makes sense.
> 
> I'd suggest drm-misc-next to minimize merge conflicts. But I can take it
> via I2C tree, too, if desired.

If no-one else speaks up until tomorrow I will land them in
drm-misc-next.
Just wanted to make sure it was OK.

	Sam
