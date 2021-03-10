Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06B33343AD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 17:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbhCJQvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 11:51:05 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46135 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbhCJQur (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 11:50:47 -0500
Received: by mail-ot1-f49.google.com with SMTP id r24so9936754otq.13;
        Wed, 10 Mar 2021 08:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R6oolcrYeb0Yyin4lnT3+FTu+4DQx6lMstBt7PUzwi0=;
        b=q3T5jhpDRW0arpOr+B2pBpKJ+vNombSvom2iHmPDIOzHaAsXgB8hsd8/tkd2ULCeUv
         1ST9bqHDeWL6GRqoiEKRHLP8KyQ37mjs6cCBW4BdUwQ2KiC3gqmRWL8E9QQmEzOi8gg/
         SdbBBi0B+QG7XDjQluu4MfLBKmV8qC1c3fWZJhKO65sA4je0+gNtZUmfPff8LnCpGAIT
         vOnNKmdvMTnSJptjZbMGjdnDRXIKWcEnm79/CqOlsxJD9HwEwok/GqAjvRJlfo7+IFOu
         7z8qLoBW/IxmgGN8bXu3xcPMy7nCYDj4fO/doBDlinTznFk0V7XRpZcOPRKBpbI3YDwj
         kH1g==
X-Gm-Message-State: AOAM530ygL5p/evcAU3aHkoFrMLdV5QrFPOUTh6CONQqca3lxhQWuAiP
        QPN+r5ks4PO+QhrbuObjkKFdbmZ8M5gWnoi5CLI=
X-Google-Smtp-Source: ABdhPJxlV/2wigpev0dSrTzB8wJqeftxRW6Co9lMLbSVPFiscoQ+P0Nnu5Je7p/f5rT4/q41GbjFbv0o9/cGohCEUyU=
X-Received: by 2002:a05:6830:1e03:: with SMTP id s3mr3331388otr.321.1615395047082;
 Wed, 10 Mar 2021 08:50:47 -0800 (PST)
MIME-Version: 1.0
References: <6660750.UgobAMfxrE@kreacher> <CAJZ5v0gCobMbDGt80exScjpGgjnbo+5kMtB6qsx1wfOf6QyiJQ@mail.gmail.com>
 <20210310160851.GA331077@ninjato>
In-Reply-To: <20210310160851.GA331077@ninjato>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 10 Mar 2021 17:50:36 +0100
Message-ID: <CAJZ5v0iOsPuNkmmH2cWY=u6C_1stkPKhUtbYM4DYvwt=EYtNAA@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-scmi: Drop unused ACPI_MODULE_NAME definition
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 10, 2021 at 5:08 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Wed, Mar 10, 2021 at 03:47:10PM +0100, Rafael J. Wysocki wrote:
> > On Fri, Mar 5, 2021 at 7:29 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > >
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > The ACPI_MODULE_NAME() definition is only used by the message
> > > printing macros from ACPICA that are not used by the code in
> > > question, so it is redundant.  Drop it.
> > >
> > > No functional impact.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > If there are no concerns regarding this, I'll queue it up for 5.13 in
> > the ACPI tree, thanks!
>
> I'd prefer the I2C tree a tad to avoid conflicts. Any reason for the
> ACPI tree?

There are some patches doing this type of a cleanup in the ACPI tree,
but this is the only reason, so please route it through the i2c tree
if that is preferred.
