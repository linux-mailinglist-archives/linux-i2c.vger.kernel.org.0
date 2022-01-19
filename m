Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF7B49324F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 02:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343527AbiASB0P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 20:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241868AbiASB0O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 20:26:14 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EECC061574
        for <linux-i2c@vger.kernel.org>; Tue, 18 Jan 2022 17:26:14 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id r15so821411ilj.7
        for <linux-i2c@vger.kernel.org>; Tue, 18 Jan 2022 17:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=h3r6GMeHdzqGZ5E/vbGG5QbK7R0c4GqChxWnblOvL10=;
        b=hD2V/FrXYzcrnywB9sv8mMt1wmz5AYgCFJyuZ+uYtJz5CiUYqweiKUSCrtmTzUfgqK
         8gSQpK9tAQny9FWBohdC97hM6HwJfT9kOAs9+Ne19U2qHgpiMhpVfb/TcHn/m+UwlSXZ
         0v3hESz/SddVeMfhiY8cNzS6Sumjrlp8TYHpuM6jb6E/TChr49toqHDG8HwHyyeQ0p38
         fjF8eCCex7bkeyd/6jWEBG9FhSy8bGLugVCm0695Xfk35/Hm2j+qnaukF76lFejbwrn7
         7F/LWW92/qbzGE4MxfAeWCQqMYm/rd4GcpeXZgqgPmysjO5WrKuiddHnmGAzSFJTGnMC
         CLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=h3r6GMeHdzqGZ5E/vbGG5QbK7R0c4GqChxWnblOvL10=;
        b=quYRRroG4Yk+cPK7KYPaqU8XECo9B9HuLT8FyAkf4FBEN/NuEgna2oWEHPdVGFvxob
         77/N+XLQ3tliksxY8jTO/MTar4FY9iOnV7i+vMSvK0RZp/E3JBVmDkG5dP8/nEMKeg6y
         wYHB+aFktMEEYT1WFr6YBnvu4Ta8/xftFRzQSkkqBqvs6BwYlPhQ57VmmeU87WMPO6Ul
         xBf4cAS89NxODISq88pqPhZtsI5+Xz50w/XYNv4jdXnE55EHqGnVpyhYmfr62m6omNQe
         cDdQYS7da87j7CdW6rwlv2JRQaPrh22Ypber8v+YNdrkDEAsk1K/Vj2XJZPC6smjcCu5
         MfGQ==
X-Gm-Message-State: AOAM533w0CEyeABbQdyWefuH0b/nswI0qW9SUpg14DZ2VO2Nz/agqYL0
        FnsJThK6wonDpmnoYJzVLP8F/E9+hNo35xQYE5YXgIJn
X-Google-Smtp-Source: ABdhPJxPC+6aV3T0Xyi2/QPmnoCqluJzRNgQw49oo1Qj7RXyuP82oipgSBvoetlVP783w3J077BsfpnC/FyfiAfbD5w=
X-Received: by 2002:a05:6e02:1445:: with SMTP id p5mr2582215ilo.101.1642555574014;
 Tue, 18 Jan 2022 17:26:14 -0800 (PST)
MIME-Version: 1.0
References: <CAPoa-_rth53JPWJB-c9hB+PCjyU=MvAHa2Db0h=ghciMgphvgQ@mail.gmail.com>
In-Reply-To: <CAPoa-_rth53JPWJB-c9hB+PCjyU=MvAHa2Db0h=ghciMgphvgQ@mail.gmail.com>
From:   Jon P <theroguezeta@gmail.com>
Date:   Tue, 18 Jan 2022 17:26:03 -0800
Message-ID: <CAPoa-_rS8foktCEU+aGFcWiVgmB7Tv92z5r0gX0Dk1DS0LcsiA@mail.gmail.com>
Subject: i2c-tools does not work with AMD Cezanne APU's
To:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Adam Honse <calcprogrammer1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After updating to a 5700G APU from a 2400G on my B450 board I am not
able to access i2c interfaces which is a blocking issue to use OpenRGB
on the DRAM and motherboard RGB controller (I am one of the developers
of OpenRGB).

I have opened an issue with the distribution that I am using and
multiple other users are seeing the same issue but I have not seen any
updates on the issue or request for more details so I am afraid that
it has just gone into the void. Full details here:
https://bugs.launchpad.net/bugs/1950062

I see the same issues when using the i2c-tools as well when I am
trying to read the DRAM so following the man page I would like to
report a bug using the i2c-tools with AMD Cezanne APU's.

Thanks for looking into this.

Regards, TheRogueZeta
