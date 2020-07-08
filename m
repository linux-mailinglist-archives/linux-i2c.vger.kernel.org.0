Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB5F218198
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 09:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGHHpw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 03:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbgGHHpv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jul 2020 03:45:51 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3203FC08C5DC;
        Wed,  8 Jul 2020 00:45:51 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q15so1857423wmj.2;
        Wed, 08 Jul 2020 00:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yvlYiPks6mhJ8cxYaoK6/i2US4+IgEbdzDKr7+cJ8uU=;
        b=c8zH5rhPF+phZfOSXO2gDlN1DVl+v/Cx3tp71GVcxczbkc9prklYE502HeCl0glvy6
         Z09D+iEq9UGcfSb1a+Mf5hdFW2kSYRq5dFk3pMDdgASp3i31c8uUpF2gg1s3hlAvH+JR
         UeHsGHrHrBE9C3c8ngoZ2Sc51llOQhaNDHXJkEM/60yS52jr1OJuqKH4ujGoY5Fnxl7u
         zJE1L7f98lSbSh0wJSbFRdGexe0fXqxTc3uScLviud8SaxkjPBP6jfRrR0P3n6lfLIYo
         bMXKLmGeXt/PYevPZZYiYsE61OdxNMFgYvN0X9WtE1addVd/85HbCIuEl7p82T+E/g0e
         4vBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yvlYiPks6mhJ8cxYaoK6/i2US4+IgEbdzDKr7+cJ8uU=;
        b=kNqbzBNMrbd148eY2ayj8oOvhv6iUoanWYk8hsFBSdPqWDJjiey7QiKfrCyJRFfL29
         X4sFRNyisGz6LyNmKQ9VwJ732ESuZk81roe3SYT5pyLBKlXcSKZKVsQUMAiqoLis3fiH
         xDmC699gVZozV2GU/u840fe4YV/hS1wSBAH/ocmraS3aB2lSvueR8opqGUjN5nfV0sip
         FLmN7Larqtw9UHDJrndIOTcoksXNYDYzQvspgJZ/e7I7nZscRkkEsaIs450ffimy4emm
         U35iBSvCu72lkQiyPvIyKzKNlyftp2OQxQdveZB8bab85C095GUuMDJX3gjs5XUn2/bZ
         lJSg==
X-Gm-Message-State: AOAM530fm/F5Md6ZfH1CybysJWkXIdfXDjjAke66EFw1AmbZ3DT8Q7xh
        CREu5KS4doGftS0CQgYNQBs=
X-Google-Smtp-Source: ABdhPJyfCRKV9aKG3yjwH2QZVnVF+A1H/3zVPGdu0ei4zSGkOGEIMvWFCSdjaZrYu71+eOEVdiEAug==
X-Received: by 2002:a05:600c:2249:: with SMTP id a9mr7625316wmm.163.1594194349997;
        Wed, 08 Jul 2020 00:45:49 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id 65sm5495212wre.6.2020.07.08.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 00:45:49 -0700 (PDT)
Date:   Wed, 8 Jul 2020 09:45:47 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, megous@megous.com, stefan@olimex.com,
        bage@linutronix.de, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, liyong@allwinnertech.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        huangshuosheng@allwinnertech.com, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/16] Allwinner A100 Initial support
Message-ID: <20200708074547.GA19609@Red>
References: <20200708071942.22595-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708071942.22595-1-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 08, 2020 at 03:19:26PM +0800, Frank Lee wrote:
> This patch set adds initial support for allwinner a100 soc,
> which is a 64-bit tablet chip.
> 

Hello

Does a product already exists with it ? I couldnt found any.
Does a datasheet is availlable ?

Regards
