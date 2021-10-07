Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836F1424BCA
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 04:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhJGC11 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 22:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhJGC10 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Oct 2021 22:27:26 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C36C061760
        for <linux-i2c@vger.kernel.org>; Wed,  6 Oct 2021 19:25:33 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id g2-20020a256b02000000b005b71ee6a855so6010404ybc.8
        for <linux-i2c@vger.kernel.org>; Wed, 06 Oct 2021 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+lgV5393cFjBh0OcyjGhmElpsLJbmXQnVDvf2tqgKRU=;
        b=SDM6DPCnvAVmyIyC8CgVNOyFkplTs3mrdtXk35LmUG5RBm0pUvO+HHlqkjUVpYTmfs
         9Xv0MDXZn4zHKc6M7mWRwKI2GIVG7bwGgJzEGUEMhXedXuF7MiGU1hEEaPqMM/p1eEzg
         zbpEec0uHkJ6eJWPEMgB2l7dDarVcDQ5a04qs+MXY+zYz4K7oAMckQ1Mc73Dt6/RHDxZ
         upqOghZffTePnlTfWAhSLzP3DIQg+Q29ptDGCxwDUdEb4o3wu03qNnvuyS4dqUT3QA2V
         bRSu79Q5q1NbwcdKXWQK6ma6KbugoHnPsGk6uIWLmuH4amu+iQtaSKmLZlEZV+SdnjK2
         PMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+lgV5393cFjBh0OcyjGhmElpsLJbmXQnVDvf2tqgKRU=;
        b=eFf/+OFr22hFcx5m0t5pV6e6Ptmdnl0jitBR5yXnhAtQnvnkc0kLAA4vmCdQQqeBUo
         w8PglbWA7Wq1udPzJ4BWX1yQk2ggL800d0CzGxJ+0XnkKdre3l5geDIkoE0Fmgs1F2/O
         Tj8uniGcAFR3aVrpCSN6MkvTwvDkMbXCeomIyOL+q0LWkTk3ipf0sBRywUuGfVgBQF8A
         ZmSGOIqAezyw/YEjNmC5KKXOwdeONeZG1duPLYwAGuscIkN+wkouJV2xUaYkSqKfMzuG
         Vckp/Jt+XuGAzkxIefN7EFyWFnUZzVk3ZRbCJeLJHWmoBheuRdkwB9WBojxeSWTNH2js
         4oJQ==
X-Gm-Message-State: AOAM532WjoJ8holKTVQWLBYS/uGUZEJ5UTA4aA9Tvc/nukElBYnT9gUh
        1PfMUNJvnIPKBryLWkkMg4mgDK7lG0Gi
X-Google-Smtp-Source: ABdhPJxdWRNuGydztvP98gc+krEQfH0p+cM9r9M3dF+WfW/5/3p7oGLL5Tt5s5OWY71JlW25rQvZ7bKnctIe
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:c416:e725:30cd:a48])
 (user=rajatja job=sendgmr) by 2002:a25:5bc5:: with SMTP id
 p188mr1748856ybb.301.1633573532920; Wed, 06 Oct 2021 19:25:32 -0700 (PDT)
Date:   Wed,  6 Oct 2021 19:25:27 -0700
In-Reply-To: <20210210230800.30291-2-sakari.ailus@linux.intel.com>
Message-Id: <20211007022527.2448652-1-rajatja@google.com>
Mime-Version: 1.0
References: <20210210230800.30291-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: Re: ACPI: scan: Obtain device's desired enumeration power state
From:   Rajat Jain <rajatja@google.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Moore <robert.moore@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rajatxjain@gmail.com,
        sakari.ailus@linux.intel.com
Cc:     Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hello,

Now that we have landed the ACPI object for _DSC in the spec:
https://lore.kernel.org/linux-acpi/CAJZ5v0gwDEjC9T7wfCqDr7R0q_ptz2nVU52_8i8noXHPEign1g@mail.gmail.com/T/

I was wondering what is happening with the corresponding kernel patchset:
https://lore.kernel.org/linux-acpi/20210210230800.30291-1-sakari.ailus@linux.intel.com/T/#m24e9f51119cbe6eb39f31c097ea3941d00a0baeb

I didn't see any pending comments, so is there a reason it did not land?

Thanks,

Rajat 

-- 
2.33.0.685.g46640cef36-goog

