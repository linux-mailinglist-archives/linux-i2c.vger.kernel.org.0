Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735DC26304C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 17:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIIPOA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 11:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729785AbgIIL5w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 07:57:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61576C06179E
        for <linux-i2c@vger.kernel.org>; Wed,  9 Sep 2020 04:56:46 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lo4so3097057ejb.8
        for <linux-i2c@vger.kernel.org>; Wed, 09 Sep 2020 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ogwkQhFvnI4MZlMSYD/QWVKe2D0wYcRnW9BslwF6Qd0=;
        b=HBjuZLWTbosii7ivJ9Ywlo8ZE/yi+uOqSm+jpG3K3CaNg5EhfDmRwyHOQ+LkqQN5bt
         r8E9HZ0CmCpqg/EgdrmGDCLKPOyUAc9ZeexJq+vO0q3W1nwuh1hLu9isrW2iuMQ2Z5Mp
         wpUEZdWa955qmiMBbYZA+9GD7k/1thaZllOGhbKDLuva5LrgIEOuqFPXBjMmPe8vc3vK
         XsQKnEd31lZOKsyuLRftddoIyY6046V39zwwVyj5TbmwMijQthaBFY4YgPRywh8WzAff
         1ODAm8vxmT1yWtxFBnD0boY5J+gj+4ot/eICHddgbieS3nKkEl7LgwIjJLFpnV7AI9no
         Scyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogwkQhFvnI4MZlMSYD/QWVKe2D0wYcRnW9BslwF6Qd0=;
        b=Ut1CxF2lScoXAPZcDBAUxDUQKIK4Q9wm5ZUMSarTrdTJTjlxDPopkZI1Ak6zXeiwgh
         SpyI5ego7b63zva1IBFCeq1UfkzISW6SGJ1e5TT3XVUxAr2z8H1QHx0HzdEbBLiA/rfL
         k3sq8LUAMCEq8kAIE6bEPwi/pN5c0bpVqMYlmuHoVgCwRB2Rug8Ulc7Z5WmF7ASlKpZ/
         Minf/u1+J4wCuculjIFxs3UqrxVHVBwHK+AHnpMJQv8ejAAFy4n9rxxQ31PR2+VeXnJo
         r8XHAfo11GMezZnb16QksXhckLOUpqBoNQpLeWed3lCW8FFyH5L1REl5hjxueoiat5tx
         beFw==
X-Gm-Message-State: AOAM532nmmsKiyAvhAk+NP1s3F7JARbNuR4JSqWkY6QVqgQ0jOVLydCl
        jmiLTVd2lBLg40d5JjxvFh5emFo6pNTQugRgsaGqKw==
X-Google-Smtp-Source: ABdhPJxwxVcYxxRPx0hopbc/8wKbrEuh526OTa/mrDYz3ssckdGebxt8RtgFJRB+3GTtZQfvkNw7vv+GO+mnfJZRYag=
X-Received: by 2002:a17:906:3e90:: with SMTP id a16mr3019456ejj.363.1599652604922;
 Wed, 09 Sep 2020 04:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20200903081550.6012-7-sakari.ailus@linux.intel.com> <CAMpxmJX40=iYYxL9Uvs1Pjj9c3NvZBGJ9Mh9-87T0c==FKEXRw@mail.gmail.com>
 <20200909111121.GJ2272@ninjato>
In-Reply-To: <20200909111121.GJ2272@ninjato>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 13:56:34 +0200
Message-ID: <CAMpxmJXDrL92QH_Vb+P4LoQ-WGBMM42GvzXjquW2Lzotm5wggA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 9, 2020 at 1:11 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > This currently conflicts with the fix I queued for at24 for v5.9.
> > Which tree is going to take this series?
>
> I recall we agreed on I2C.
>

Sakari,

can you rebase the at24 driver patch on top of Wolfram's tree as soon
as he merges my PR with at24 fixes?

Bartosz
