Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE09812E914
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2020 18:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgABRGT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jan 2020 12:06:19 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:38655 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgABRGT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jan 2020 12:06:19 -0500
Received: by mail-io1-f68.google.com with SMTP id v3so38921961ioj.5
        for <linux-i2c@vger.kernel.org>; Thu, 02 Jan 2020 09:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vbeGgWiwaN14SP6RADHxU0ZkFByo7evE/fTu+huoaas=;
        b=EwK/iV64nbL4ocWWfmlaskYW+j3yl/sA6y/45qlt20N+QIdTHHKSlE8x/2fRWFPE8R
         UOJopxp1+nXHIZdZAyQ+IhQI4ZxTYRZrUvSXjX8wcGqZnzy2Zdv8tffqbJVfmPTQpIdL
         HKwWGe32/rupFf0GATcCAmgBSafgInHZAkb+inWMWCg/Nr08SBeePR5cZosqtXMIZkV4
         hoRm3UlhYrne9wAesS0p4Wtle1WZwh6iN2kbT2i/9+Mt5o0QpP+SRmEyJ5as+x3/UeBI
         UT7KQBHBAAaM+qj09O/ZhQ+O+ZEoOainj2lyLDZg4wGaIorbBNM9r4GFvjd2rCuz8g0G
         HtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vbeGgWiwaN14SP6RADHxU0ZkFByo7evE/fTu+huoaas=;
        b=fwe6fcjw90pw6nBDIGXDzi7XvZFd5JTwxA03Wgn/UXkDoVPkoT7Kp6AkCrG17bJogm
         05RTgiWZ8FpzliddcmfWr9VBpyrej6zZJmrqEvsF827c8kiP0FosYZqMP71///RvBtYS
         2U5PRO8jTxG9ijtfoLAMDgtqDBY5wJrRejJU7zY2ZBJSqptLJpPDNKSnXop2WG2slL9O
         1mgBCR7by0R0qx3DUsWOcd7GZMajahWKODZGNj8k13vOgPwReA80X5tATDuVIHzy01qr
         BXunznhEmZFWBvFLzn3hG3Hel7LK2lXQ39YakElWH6bHW+YhPcCwlM8XN9Zh/kT3FsD1
         80vg==
X-Gm-Message-State: APjAAAUUCDv7IpzA96Da9FBGe5x3sKiSxPZCEGrDWOTDi+yWlqhFLl/x
        /Ox+OihaIpn6zuimxy1qqWOVkHgsa0aADrgDxqyMMFZLzOA=
X-Google-Smtp-Source: APXvYqzYcsu5E3mcDThFu0rMkSWUQLYhK7cUrx3GPZ2TR6vHWFYJAncgtgX9Nt4cIOL/XdZHzzFuzsV49LAPRiTxN8E=
X-Received: by 2002:a02:40e:: with SMTP id 14mr63858858jab.102.1577984778452;
 Thu, 02 Jan 2020 09:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20191219105558.26479-1-brgl@bgdev.pl>
In-Reply-To: <20191219105558.26479-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Jan 2020 18:06:07 +0100
Message-ID: <CAMRc=MdexCWZyQOfno0czWgy9EXN+8O_RmEpHxXz0R9tMD3g7g@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: update the license tag
To:     linux-i2c <linux-i2c@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 19 gru 2019 o 11:56 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The current GPL v2.0 or later SPDX tag is 'GPL-2.0-or-later' as defined
> at https://spdx.org/licenses/.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Bart
