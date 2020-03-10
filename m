Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D850D1801F3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 16:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCJPfP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 11:35:15 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39791 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgCJPfP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 11:35:15 -0400
Received: by mail-pj1-f67.google.com with SMTP id d8so564521pje.4
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=EM9VJ6nxTtUBRreIKmvsLUlLVBtKCkiQDGFe+a+hzvQ=;
        b=l4t58QwNZM+PjwGIqw0ITjX4Z6H77YQ+VFKzyxV+D/xtxoSmLER+OXRcTrHjS7zyPB
         GfGvCeRKiV6h3kIxbG8dYgSaSZoujQNoMLMcUU1cMHNeUwEqzY0wiRvOiteaHGWaUVxo
         qugmyQQbTFZx+qFz0I1kMFVE1oGBAmGfa2tAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=EM9VJ6nxTtUBRreIKmvsLUlLVBtKCkiQDGFe+a+hzvQ=;
        b=gq/pT/cxDo0Y+s2+igad4dUcRPSlQDBr1M2BTPwLJqJhSq3rVDS3Fkcn2Jj9D32S9a
         KBlhi3sObuTDPHFUDLsSG6i2f7n+v7QorlC9lahOmVrgiTqP8DUqAVsBAv8Gr4HknXKc
         Sr04PiRll9hwVMq7XKCDUXXf4NaIwKx8hz/om4f9YiNkGCAb5aHOlW6eTWQO8OqNLJY+
         f//uyyH01eFnnSbxOv5pUlZNqI45gaVCQXg2LN5QRJ4fm9LXZ8VWsHaKspcMIZUVxYEo
         iT2GNpC1dcgXlCqZK9qdOywUpal7JQ0kb0rClE3cc6xS5N/VQIoSjrRHeub/RFfV6Nnq
         L0hQ==
X-Gm-Message-State: ANhLgQ2lESMq2CdPZluPz7u/2+535JpBXejTwUdBzNTTQCFIoZDxsa+Q
        ez9qk9wpDk9FbQj6EowYRKKlaA==
X-Google-Smtp-Source: ADFU+vsAkBrbFp7fTBc0n/vYH++HL6rDrVZ3ftxqofpmllV0r6lddj1nIS0ZwK2dMh8/hlaU514BMw==
X-Received: by 2002:a17:902:8bc7:: with SMTP id r7mr21490943plo.12.1583854513164;
        Tue, 10 Mar 2020 08:35:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c4sm1650pfc.88.2020.03.10.08.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:35:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310094159.GG1987@ninjato>
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-2-swboyd@chromium.org> <20200310094159.GG1987@ninjato>
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Let firmware specify irq trigger flags
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Date:   Tue, 10 Mar 2020 08:35:11 -0700
Message-ID: <158385451115.149997.17354220554214087646@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Wolfram Sang (2020-03-10 02:42:00)
> On Tue, Feb 04, 2020 at 11:31:50AM -0800, Stephen Boyd wrote:
> > We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
> > should take care of this for us. Just use 0 instead so that we use the
> > flags from the firmware. Also, remove specify dev_name() for the irq
> > name so that we can get better information in /proc/interrupts about
> > which device is generating interrupts.
> >=20
> > Cc: Girish Mahadevan <girishm@codeaurora.org>
> > Cc: Dilip Kota <dkota@codeaurora.org>
> > Cc: Alok Chauhan <alokc@codeaurora.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>=20
> All patches look good, but this one doesn't build because dev is defined
> in the next patch only. I also can't apply patch 2 before 1, so please
> rebase and resend.

Ok.
