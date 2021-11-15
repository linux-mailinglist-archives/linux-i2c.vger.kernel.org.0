Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81412450A6D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 18:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhKORFb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 12:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbhKORF2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 12:05:28 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB95AC061746
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 09:02:32 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id k21so22387277ioh.4
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 09:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nijsmPQc+akyPlfu7TNZEY9OJhbTBh6O7p9FQtmiIsM=;
        b=PJKhHv4pOrxh6HCO/0IYzIl/6cVowP78JFfCGVk8hz+SQDYnRSi0cNyw2LGWj8QMiO
         YqKZo6UDKpxGdnw13mPS6rN+v38ODpjK93ldosKXzJ3vMXYal1s2oXgQgOVstZklrxuF
         aXFtsSosPGwAcyZXk+kqxzBwKnV8D70BmvINk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nijsmPQc+akyPlfu7TNZEY9OJhbTBh6O7p9FQtmiIsM=;
        b=aNRU8SclgTVfncnc6bkJ76ygaMYoRMVgBIdL3xK2mgGtQV9EkzuUEmuuiTGKSH5sN2
         H9NHM7q3T3eu5Nlo//TclpQJs4CsHtrMOTcKgT5UxYiVzeICc3tAa9/UXZlJBFH8fgg1
         c5MTHX3U0Kz+N/YbC/iDguFWZxmLunihZPfmWd9z4CWMV43Oh21SG79DuYFRoFTER+4w
         1l9A1Hao77W/GtI1Na4ZBnVmuYydbUvdPRX07A4sIb2e256QRFPdjGVDpoP+OUrgShYb
         Pag3iublx3Po+Cz001wzU2lmPkiZKvraH2gtOESJYgvHPVbChKWdL7t4U7hoAtIGweXW
         /Ehw==
X-Gm-Message-State: AOAM533D+FonDXzyAB6Oda4Jka0YG1hrsVHobghIgEuBZzvG2wbESu4b
        GKauoAiwIPF+Ai9ev9NJff0vdHD6rfvU3A==
X-Google-Smtp-Source: ABdhPJygwZIV/Q/TbZFkJfZJOI7NaCWjYAje7YPkCR6pB62NGSQRLkAqHNB4uKpnHfMvDpIq+MrXhg==
X-Received: by 2002:a6b:f212:: with SMTP id q18mr260267ioh.16.1636995752289;
        Mon, 15 Nov 2021 09:02:32 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id c7sm8342528iob.28.2021.11.15.09.02.31
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 09:02:31 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id l8so17448551ilv.3
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 09:02:31 -0800 (PST)
X-Received: by 2002:a05:6e02:1c46:: with SMTP id d6mr224481ilg.79.1636995751375;
 Mon, 15 Nov 2021 09:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com> <20211115154201.46579-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211115154201.46579-3-andriy.shevchenko@linux.intel.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 15 Nov 2021 09:01:55 -0800
X-Gmail-Original-Message-ID: <CAE=gft7+a2hW-EZz33=ApFAGA4HSOfQS_LGH9YMvDtM0=F0uww@mail.gmail.com>
Message-ID: <CAE=gft7+a2hW-EZz33=ApFAGA4HSOfQS_LGH9YMvDtM0=F0uww@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] i2c: mux: gpio: Use array_size() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 15, 2021 at 7:42 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use array_size() helper to aid in 2-factor allocation instances.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for the cleanup series!

Reviewed-by: Evan Green <evgreen@chromium.org>
