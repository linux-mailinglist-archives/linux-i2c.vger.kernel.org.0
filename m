Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69D714A493
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 14:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgA0NJ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 08:09:26 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:43777 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0NJZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 08:09:25 -0500
Received: by mail-lf1-f46.google.com with SMTP id 9so6132875lfq.10
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2020 05:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=MBbZSDAQmj2xEPju2e2Tf9R/P8YHDPPWVxmNEAp8kcI=;
        b=lV5LF8KH7cxeGfaYJnJULLbXnLSKXwxDmtQuSTmGadjXtOh+14dYDuRT3X0cuGtxCS
         IgY70wqGpJ5Cf+aoTs5vBd3iAj9fBLF15T+nBl1Iu+hQd7gKUaY9UAHn1qYUxxLKgIrI
         xhuWHoxEY7cwdHwmV6ph0PLpL2+RSgxrce/AqZ5GBg939f4MBRsrpf5wD7KiXrQzvr+F
         N8z5ka+3f2G+Y6ZHDK3PezuFVRPCtaiCMkYU1m2OGEM6r8Yt8UyKsAfB3UMS7rixMgd3
         kquCCUOqL3kIe+3aS8XDHbAvUOuvyCRcSUvXK+YYwrE+DPh/FfQB/CwMQfj90LiWAAlh
         i2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MBbZSDAQmj2xEPju2e2Tf9R/P8YHDPPWVxmNEAp8kcI=;
        b=b9M21UuGJoZR0WCfHjO7EkXqf2OPZxUW89tOYgBNn149V2L/Rq2v6U0GNmiXkGJtgI
         QzOS6qaN+dZF3n96mXrVCTQjjnSvt5nFn4n4ncMzsS/TmcVN/YKqCebUtKpXugA5Qms/
         UeOxH+Zi7/qjuhH7lHhEyV9K5y3yrtGhA8O+ufc910EkpPzOyXrZSJ6i+gHXjL5ZcLTb
         PgN1xZCPYCsUNxVpHRoFaDpEbQsHejR1bijnbH1/MdH4qC4lyTK/389IAJs69WNujd3q
         5hMv/JT/kcCW5+mu4couPZWlNCYZ6h2zDFF8HcDowxqWID8ir2drueMEd4ba8z9zzLzB
         ZxZg==
X-Gm-Message-State: APjAAAUBDKydJ8NDF4sxY0xTY6LsCFUlTCT95NR7jNeUaChC7ULjpO2N
        S5GPFjRoh2LFWoonfpnsK+n3rffXk6W4OpjWPPYXkJyF
X-Google-Smtp-Source: APXvYqw87bzqDQ2LKIB+2hQNtOo2jGvdjzOADR24Sa3bRFsgO9YXSR8SrS3jbVATlUN4eHHwrpmQTAstKJOBCwTgAo8=
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr2835609lfl.215.1580130563680;
 Mon, 27 Jan 2020 05:09:23 -0800 (PST)
MIME-Version: 1.0
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Mon, 27 Jan 2020 15:09:49 +0200
Message-ID: <CAHb3i=sF_mAMzSCLJ2O0mQz1RadHyL8pVsGB1i_a5ZbGL+Yncw@mail.gmail.com>
Subject: npcm-i2c driver
To:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Please note the following patch is waiting for review:

https://patchwork.ozlabs.org/patch/1198846/

Any comment will be very much appreciated.

Thanks,
Tali Perry
Nuvoton Technologies
