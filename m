Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFA0109347
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 19:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbfKYSJA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 13:09:00 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34131 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfKYSJA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 13:09:00 -0500
Received: by mail-ed1-f67.google.com with SMTP id cx19so5881345edb.1
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KP6fVh4ZaU6CUB4fuJ2JgxOsEwtpNNCuWcHmOR+TQM=;
        b=Oouu+mmxmI9i+ll9lg5GVHV8Xb5oK+ZTu3+qMDAvnCiQLuG5SjclA1bPFonOsT+xEv
         CuPOLVCp8rHK0EBitUUP7HyBHbiygW28t9pxcd8UroWl+5RRfNUl0ZU0ESkO5pfDyz1s
         l2T86jCUA+jHsvoLznXvXPW8mkNAA9BomLbBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KP6fVh4ZaU6CUB4fuJ2JgxOsEwtpNNCuWcHmOR+TQM=;
        b=um/5pokG+AoFxoQcMMT88RZ+uumF4HoZ6DRUqvPuP6qTGC2sp+a4wOpgKoNUJjUyfT
         pA6/BPigH3W8NfHNgQ2CYQQP+MCVFvxglD8H89M0WKAe7wO2IyO+v5rbyWIRFAyLOBhR
         QBC31pk4RfytVbI8xbzomNPG6jdzANc05aqUZBMrCBkknwg4mVmZ1wp/RKVMP8F5Zf5Y
         gxSGadZCL3xN5y8AERtHHO2QV8ZyDVpwVli1XkWtja6yU8Y51Dg9qkiOVkUL5KpJjbTm
         iqoCCjvpM+tXTl8HRCvkRGSO6eYGQ4Ggl+iW3g+ZhFZxTeKDRZRgZIy9VXaQQWOMrPzn
         NAHg==
X-Gm-Message-State: APjAAAX/AoU78OXPC03Asq7NllMbj2SFRX2x+zvRBBj6NrfhH+np5pyh
        ILxG88Pv9fsz44fUO9ru847qx5htfjs=
X-Google-Smtp-Source: APXvYqxVK+BLg6WzQP8lNk/t4HTW4WvkyK/qWjeS/FpCIUR/QSQbaUwcA+xThp37PxhFXHKVxn3+lA==
X-Received: by 2002:a50:ec83:: with SMTP id e3mr20153569edr.292.1574705338758;
        Mon, 25 Nov 2019 10:08:58 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id j4sm249904edb.63.2019.11.25.10.08.57
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2019 10:08:58 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id z19so302128wmk.3
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:08:57 -0800 (PST)
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr185973wmj.28.1574705337285;
 Mon, 25 Nov 2019 10:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20191121090620.75569-1-akshu.agrawal@amd.com> <15b0a142-a62f-1783-fe46-f5654b618f33@collabora.com>
In-Reply-To: <15b0a142-a62f-1783-fe46-f5654b618f33@collabora.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 25 Nov 2019 11:08:46 -0700
X-Gmail-Original-Message-ID: <CAHQZ30ALpF+2N8ZrA3LxNsh4Umf6x8YzEwTKCPst6LDpYU58Nw@mail.gmail.com>
Message-ID: <CAHQZ30ALpF+2N8ZrA3LxNsh4Umf6x8YzEwTKCPst6LDpYU58Nw@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-cros-ec-tunnel: Fix slave device enumeration
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Akshu Agrawal <akshu.agrawal@amd.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 25, 2019 at 8:32 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Akshu,
>
> On 21/11/19 10:06, Akshu Agrawal wrote:
> > During adding of the adapter the slave device registration
> > use to fail as the acpi companion field was not populated.
> >
>
> I am wondering if this a fix that needs to picked on stable kernels? Which
> chrome platform are you using?
>
It's a fixup of https://lore.kernel.org/patchwork/patch/1151436/ so
unless that patch has been ported to stable kernels, I wouldn't worry
about it.
