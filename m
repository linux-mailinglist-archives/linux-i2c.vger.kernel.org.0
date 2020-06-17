Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987811FCD57
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 14:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgFQM0H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 08:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgFQM0H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Jun 2020 08:26:07 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF65C061573
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jun 2020 05:26:06 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id w18so2478367iom.5
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jun 2020 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98CHDYw9UFtivO/XJvpzYDjpHD4LYvINxJ5KpxjEFxc=;
        b=MWmyPGkL06UQCXnShYNqnqZ083GN0ANuXO9BRidwn+tddP3uHK2BN6y0VB2chbcayQ
         hTQDsqbkR05JmKUxEjwAbcxGYvvjNc8e4WQeQIaNZ6LJKOS6X4yMuo9dZveyyX6xDhnc
         55GAfjFIMMJtyJs5VNWrkXTPCHRsPV/W5hLiudTFNvWtUlKw3kR++DtZ6JhXzOB8HTil
         pgZKZAkdqrrOB64efZwu3wQD70GOiEZLsv2ussQWJh9LZrrzcf1nh/XTcWs0xhQY+hm1
         tsecdPQGgXgwmEM7QdyLIx2Y04knI7gtAt2/h6WbOpMkgI9oduY00zZPJcH64A+ld9pc
         2gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98CHDYw9UFtivO/XJvpzYDjpHD4LYvINxJ5KpxjEFxc=;
        b=PU9d6UPBmOGJinJrRKCMKAZ2/M8/nrnl/ocvCoc2Fr5YdV8wU17SGUoaOachvn1K1z
         cFzTVRJZ77myL1VjzYuzUS7dwYk7rwx4AHvht/xTSO2+2DehZICeUwMegr07cMJDjpaR
         5JbbWDAIGScF63dlcJ/TOBubItFSeBsrf+LB30gbvy1GRG4m/Khc7xAkfpe1WzitdnTN
         /tk8dZA7k6bOa70+Vp/HbjFXJbzsFy/Z3vIqH1zTBkpaqwEWM1hzGpDcs6TjcG4DPcHe
         aimnYLCd1PHsQ/bM2IzaHv4mnB1VoqtuHsc4TfORpWkn0WYpSuswaxgHjtpCmaAFVegT
         52KQ==
X-Gm-Message-State: AOAM533etnKPJjjfUujBrenjyFvmXSO2xFecMBqqJBSRKD22SPdTkj44
        q1RXshUaG3KnnrOQoddolvniw5dNQjn7rWUIFE8=
X-Google-Smtp-Source: ABdhPJxaAaWiSCZ7kwiPFWFy7WS7VSVTRqVuYJhORzQivJ1EY+gQ1Dviu9bk3rY8cmbnn4XqU3FL3+j4BeCjwD8LXRY=
X-Received: by 2002:a6b:9054:: with SMTP id s81mr8075002iod.122.1592396766163;
 Wed, 17 Jun 2020 05:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200613150751.114595-1-marex@denx.de> <20200613150751.114595-2-marex@denx.de>
In-Reply-To: <20200613150751.114595-2-marex@denx.de>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 17 Jun 2020 17:55:54 +0530
Message-ID: <CAKfKVtFZnDv13CWJcSSP1tKmsG5P_Kn+RWQyFwdYh2dT6tfg_g@mail.gmail.com>
Subject: Re: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
To:     Marek Vasut <marex@denx.de>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

On Sat, Jun 13, 2020 at 8:39 PM Marek Vasut <marex@denx.de> wrote:
>
> The interrupt handler is missing locking when reading out registers
> and is racing with other threads which might access the driver. Drop
> it altogether, so that the threaded interrupt is always executed, as
> that one is already serialized by the driver mutex. This also allows
> dropping local_irq_save()/local_irq_restore() in xiic_start_recv().
>
The idea of the local_irq_save / restore was to make it atomic in case
there are a lot
of non i2c interrupts.

so it should still be needed right?
