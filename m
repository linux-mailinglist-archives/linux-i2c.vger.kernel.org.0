Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D4F7B0697
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 16:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjI0OUU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 27 Sep 2023 10:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjI0OTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 10:19:36 -0400
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996511B5;
        Wed, 27 Sep 2023 07:19:33 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57bc11c197aso802730eaf.1;
        Wed, 27 Sep 2023 07:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695824373; x=1696429173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fsMC5H4Z8qtaB2lZAxAGWhZ2+lXG0cqJH9ZgXG/PH0=;
        b=G/x1RPR9etQ5jaonQ1laEbunSCSRJpO5xKuw6DnKXuNZRIz1wp5GLbbQ7C7+CiifXq
         ZifGi/LrGbkqQoa9ZOVbHdC3CHqt7dsnzP8cZ6mFdbo3BnNOqtulEtV0+0Qwa/gqFtyk
         pBrurbz1p70BjZRHxAbvckK4VmBZojdYsML6rc0sOyfrTqZ1kjtF5R+pkYPCy4v0QyOP
         Ses/1QKanfpr6L2pVA1D5qJSuXdI1yKVbmmmYT2q9gQAfDzc2F6mH1wlFBIm0Za/UnAx
         jIOevQ38dTSk7EGqPDwAS1JKbfe218wU7jmReKv16DjH1K21zpDylet6U5GyqChZd+js
         GFKQ==
X-Gm-Message-State: AOJu0Yyd7RCCrOPKe2Iw+nNKJOG33On8zoqIepGBlsI36FNkXRDrd6lu
        1NR45JGBzUi2Tqe2VEVz+0ZhuGU2W7Zev1iCs/I=
X-Google-Smtp-Source: AGHT+IE5D4KvhPI0G7z3IXWIl6DYNM1UWdx6BFCNnLTAFwRLK84+vP7K7lu49bAFkOV3tFG8TuU/avsHeWrkR+yMSU8=
X-Received: by 2002:a4a:ee18:0:b0:56e:94ed:c098 with SMTP id
 bd24-20020a4aee18000000b0056e94edc098mr2682527oob.0.1695824372783; Wed, 27
 Sep 2023 07:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
In-Reply-To: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 27 Sep 2023 16:19:21 +0200
Message-ID: <CAJZ5v0hq37x_v6Z0Vqj2h8D5QZM8zWE4=GfrMk7YAEfUjeRydA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ACPI: PCC: Define and use the common PCC shared
 memory regions related macros
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 26, 2023 at 2:33 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> This set of 3 small patches intend to consolidate and replace the existing
> locally defined macros within couple of PCC client drivers when accessing
> the command and status bitfields.
>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
> Sudeep Holla (3):
>       ACPI: PCC: Add PCC shared memory region command and status bitfields
>       i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
>       hwmon: (xgene) Migrate to use generic PCC shmem related macros
>
>  drivers/hwmon/xgene-hwmon.c            | 16 +++++-----------
>  drivers/i2c/busses/i2c-xgene-slimpro.c | 16 ++++------------
>  include/acpi/pcc.h                     | 11 +++++++++++
>  3 files changed, 20 insertions(+), 23 deletions(-)
> ---

This is fine with me.

How do you want to route it?
