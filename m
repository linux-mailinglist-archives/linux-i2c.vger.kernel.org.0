Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E38412A5B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Sep 2021 03:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbhIUBkf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 21:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhIUBiZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 21:38:25 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6D4C0F26F3
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 12:19:30 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h17so65462107edj.6
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 12:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=fp9r38w6amQLLvTAiwIsjF8K3xb5UqRs5czOrtsuCvM=;
        b=WyXUx55RD9T/akSSyNbWa+pqbN1GcAW/AQZzAiRTxjAB62a9Rt54d5aCcmO77QDK1n
         sMILE26XJqKdTUp/kkYxj6kwY6zb3YIq2hNR8fS3Z92C1GC8/Nj62CrPuY4lBtRJ5EZ/
         WZhP4v0+qyOAGNDgvhVRY1aBwChUQp/VDUw5eTjlt/89+9QFIiubvQLaMUa+8hLtjAv9
         7bSti2JzGlzEtnYvBTfwZbgXIt/PMRbvTPKmYTMCzOtZgWCiw9Pi9RUOF31dYZ9HFJoJ
         zw9ePU5KexHdLgnaEH08dR/OT6ayh+HHzDwN0riEGiuCFtWcQCgVzZeLCOcfEKlzFrMu
         XNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fp9r38w6amQLLvTAiwIsjF8K3xb5UqRs5czOrtsuCvM=;
        b=CV8ohpuUd7rFkyoO0oAj+Ar65yCeaZp67YdquBmo58YDPxBZChnbICcJsfz2RQciyq
         uGKDw+ZWfOsePyqCIeBVHK4s1u78SACEpsIWq8cX8n2uHLs9n5nNWxCKGXY/oRJXLzEk
         2Rtce+OtRjVGAKSjJA/ef4MtUaEsNCAA2U1kiwT6rXxasLKUL1k2Gq75AePUP+AtErw/
         NEZeRFo30bFyzOjzGbfYsqDnMnJmhnLFGB/3orrkO5MjcuzsG089twXAOhnhoHaiaeU2
         x3I5MJLb9NtUXnQFb8SYqtD9Mz+iRebMWLe0VQNmyRzEFFAlhrxvUUhbJVswKzKdAH6k
         upIA==
X-Gm-Message-State: AOAM533U+rs5gvOkRC4S4ZCrt60HPv/X4eklm7RHobK5hnQhDJJjxVHl
        GhbNegJlyUaW15TukSqd7osQDzSgEMuSpLnSAyCEEkfN
X-Google-Smtp-Source: ABdhPJwwU/JaOuWPg5i+dZkWcjJB2TmG2yTgVDrdJw0EITuB8mjkCx71QUGTX+vugpfbQWuTMzjk8dT2WSR4Ou3/cu4=
X-Received: by 2002:a17:906:3012:: with SMTP id 18mr31564202ejz.136.1632165568381;
 Mon, 20 Sep 2021 12:19:28 -0700 (PDT)
MIME-Version: 1.0
From:   Steven Stallion <sstallion@gmail.com>
Date:   Mon, 20 Sep 2021 14:19:17 -0500
Message-ID: <CAGGHmKF6HH+0cQL9_DK+-osSLFJodQODpaaxxF0r0HYXqo82Ww@mail.gmail.com>
Subject: Introducing libi2cd
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All,

Over the years, I've had the (mis)fortune of needing to write various
I2C userspace drivers. I've long enjoyed working with the i2c-dev uAPI,
but it does lead to a bit of repetitive code between projects and
testing system calls is cumbersome at best. I had some extra time this
summer to put together a small library in a similar vein to libgpiod to
help with these issues.

I was curious if there was any appetite for having these sources hosted
on kernel.org to reach a wider audience? I'd appreciate any feedback the
list may have!

If you're still interested, here is the introductory bit from the
README:

libi2cd provides a simple and straightforward API for accessing I2C
devices from userspace. It relies on the i2c-dev Linux kernel module and
is intended to complement existing tools and libraries, such as those
provided by i2c-tools. The design for libi2cd was inspired by libgpiod;
it provides both high- and low-level access to the underlying ioctl
requests and has no dependencies apart from the standard C library.

The project is licensed under the LGPL-2.1 and can be found on GitHub:
  https://github.com/sstallion/libi2cd

API documentation can also be found on GitHub Pages:
  https://sstallion.github.io/libi2cd/

Cheers,
Steve
