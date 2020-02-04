Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D2F1521A8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 22:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgBDVFk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Feb 2020 16:05:40 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53235 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgBDVFk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Feb 2020 16:05:40 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep11so1952841pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 13:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4n97ove0a7U6N3IS1aQ2vAxrDe154szNKA6jAhkdMo=;
        b=TbyZS2bztW3/Ni9l0vkFs9C+yhK/6c5krjjIMTRhDNBsGG1tX8810Lj+BoF8UXuDcO
         a/3+4s2aHxbBkIA69OsqZm5vb9+G2A/c9ApnDoz/zYnkjEeCv/ZQI+HvLDKrMP1gUabl
         Q7OeZX4vzWOienIvjsidNHxzLFvqTaa2Bd22dWXCKmIEW/ksl/86SU1FE+XJbSXffnvE
         yczKot6tDwKhTKMxstmRsF9VYd2ZJWo4OvS0P0RBG2XHB5hkbw0H6RfrQ2sL3fZHgtyV
         bhiN+L/g3IcqWALGO4Abp+tEHnSwqiEBCmD/YKHNCZDq1FQTUvsU9q/57oXC4OI39fDG
         ShVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4n97ove0a7U6N3IS1aQ2vAxrDe154szNKA6jAhkdMo=;
        b=cFVlpBxoDsjDzfAGfmdmVl9KgGxQQcqvh6RrZ/91eOxZFLXBP86ZxRE1xmPwV48Id/
         jfnNCcZc3d68Wp0HhXmvICdy0YYJwdVUDCV7xOBTw/z1thmCW9zlNXLbu1hbwmioaSyy
         DLQuVjdHJXCxkq6VJH5iSQKBJI7ugFUDQNjxgu2wZO6qcL5wHoQOj0gH6v+CF6M6RJS+
         kEoiwVKs+GcDq97rWi6GMne0ahVEHo+usepw1pQxVbTw12GtUL+mpb4BzvCRRjUFBfJm
         wIKLkXQDz+gYaheh5eSli/9m/SaYI41N9MzBHXiw/KF1C0DDea9ADgjmUOk4Jt0lGn4K
         jmOw==
X-Gm-Message-State: APjAAAW4HIMMgq4YkhnuAgG90jDD9ridUFcu4lE2FZZpuIha+V2nWZDy
        /KB1LMIwAGDZe2hhiFMqoEhGatEV4u7hK45VR7uZLQ==
X-Google-Smtp-Source: APXvYqzgRC3LpUpsV7bDuumUM2fd8cz2P/cb1FukLOm/VuFeIrTAXDU5BVFfOtS6u7Fgfqgqty0o0xN6Arf4tkVcHUM=
X-Received: by 2002:a17:902:fe8d:: with SMTP id x13mr32325551plm.232.1580850339164;
 Tue, 04 Feb 2020 13:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-2-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-2-swboyd@chromium.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 4 Feb 2020 13:05:27 -0800
Message-ID: <CAFd5g45FtwHyfptDEZJ=QJT1uRcwWa6+sHgqaodcNGD4izmT5w@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Let firmware specify irq trigger flags
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 4, 2020 at 11:32 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
> should take care of this for us. Just use 0 instead so that we use the
> flags from the firmware. Also, remove specify dev_name() for the irq
> name so that we can get better information in /proc/interrupts about
> which device is generating interrupts.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Seems pretty straightforward to me.
