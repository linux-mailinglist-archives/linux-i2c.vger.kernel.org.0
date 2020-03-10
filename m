Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D7517F185
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 09:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgCJINd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 04:13:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38302 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgCJINd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 04:13:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id x22so10066802lff.5
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 01:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fngnZzsPX/Z3pvbT/spOB3nQaADitepn3bz5DU3/OtM=;
        b=VBriEsxKnwT1JcM6heZ6yICTCYjfuu7XMPzyBmof8T5+p8DCnpANcnqCxBmqOsh5kM
         A/g4Vfy7BfMErR5UMWXCI2+uyHtiWCtXQUIxjuYtO41lAXHnb11ODtQf+QBNvRUHm1sH
         egsGeLM+5JIxeDbKkmSnCzqmOb4sb5c2YIBceyMOJ+fcQhWbZlLiWzdh7vFA8h/uEwTO
         K7eDm9K4lpxl+DshV6QeAot4tPzusy+OqWmEmC9H5MloLus5N2hIw3CLvhkQYsQECs6J
         GL77bOqK5V5Sy+tyt053OVBZirRHDlzit3TO063puh62/2xEY4uONS5ksi5qCC5x5RM4
         kwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fngnZzsPX/Z3pvbT/spOB3nQaADitepn3bz5DU3/OtM=;
        b=sQMJsTlwHSPajceT9PrYMSB6hNic9tmdDtxm6JYOxKYVoqAumZYEZXSMTH/jnI21wr
         nVpB1Q2qK0RL+plv/Ku7bQDjgvzsQiUcxVnasaRrWKrc8eVZGfLP4fEaOC6oDQ3ZktNC
         MO4MzQc8SPH82K1l7X4e9V9V8+NHN3gIV2k6VC8zjVjxI52LqUXC9L5uaVnFl3K/dhFX
         3Jkf22/AedDr1r4wTaTEQSMQkw8CNE6Vb+kaH+dV9fUSAkqneTg+cil3QAdmC6+3yHvd
         2JLOM7Rvpx4naeoTxP0B3dE1y61UWa2OHuccxvVEtv2ao+q/i19pzGWfwzoxvtrNwnHV
         ssXw==
X-Gm-Message-State: ANhLgQ3d7CPNXPMrH5Lo8MjIm4QIlX2kdHeSbiB4NZOJHzU361JTowi9
        UgM7NyzxRXKwCS6zlC0gNfU1ee9pF7viaA1im5jRoPWj
X-Google-Smtp-Source: ADFU+vsxMxlX3LYHN/NVnkogpV7DWIrdl/wu243Z3+6Zy3XgeU+btPaXrl1ACxYan+mI/kNIpdci/vDt3L/ct/gQ2Jw=
X-Received: by 2002:a19:c18e:: with SMTP id r136mr11160054lff.4.1583828010833;
 Tue, 10 Mar 2020 01:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200309211618.25535-1-hamish.martin@alliedtelesis.co.nz>
In-Reply-To: <20200309211618.25535-1-hamish.martin@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Mar 2020 09:13:18 +0100
Message-ID: <CACRpkdYwENREw4uCd_tuWWXfv7k+MHOF6Bq=r+JcBHBt8aGuFQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: gpio: suppress error on probe defer
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 9, 2020 at 10:16 PM Hamish Martin
<hamish.martin@alliedtelesis.co.nz> wrote:

> If a GPIO we are trying to use is not available and we are deferring
> the probe, don't output an error message.
> This seems to have been the intent of commit 05c74778858d
> ("i2c: gpio: Add support for named gpios in DT") but the error was
> still output due to not checking the updated 'retdesc'.
>
> Fixes: 05c74778858d ("i2c: gpio: Add support for named gpios in DT")
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Maintainers have varied opinions about this. Some think
it is a stopgap problem until we get probes ordered by other
measures, others think developers should simply learn
the meaning of error -517 and realize it is no error.

But this is fine with me.

Yours,
Linus Walleij
