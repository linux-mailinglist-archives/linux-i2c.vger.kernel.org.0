Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC427B6A8C
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 15:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbjJCN3b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 3 Oct 2023 09:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234951AbjJCN3b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 09:29:31 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EA2AB;
        Tue,  3 Oct 2023 06:29:28 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ae0df6494bso81534b6e.1;
        Tue, 03 Oct 2023 06:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696339768; x=1696944568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgTheVskLJNxwiIux7F+HpZW9rPZyOHwxwNzj7ZHzWs=;
        b=pTQGlo8F0KaNU1hYktJ01OiTsZ+GSovTdWmWfMuFJWFvnlqxflykx6jSqhuSpEU6lz
         UjcCgGYrV6TrR3Skssat1+89DDV5tahbcfh2aZFHcsatvcwqGU4qkSl3sofJS3XXo3tw
         f5lRyJqSvS61PVz31tIt9BT3P3KIZccJR/3rHHhF0XB+yQeC5buCde1RUvgEI/dtVFA2
         DmBsaZSUoF2CFySwSLs93qGq9EVPJplzn5zjoTp0PDMfTkn1UfxE4m7efXCPeo0LiWgk
         0MkFwQUx4zvU0htw265NjQ1GIhsE3hYfOv21aX6WQLCpZW8XYX6zl04nprahWXDeo9KY
         2dZA==
X-Gm-Message-State: AOJu0YzX7J61IALeh5RL+UPg8V9EPLPG6erdDzHBQ73KRByyje9ex3UR
        B3XDcO9XyqT10cVErjkFNNUdVl7cTpFMSJUeq60malGi
X-Google-Smtp-Source: AGHT+IFvgpZtGFxEjqXVRDrG6th4u6a1MW/1xTy8JY7Gv+arPmgxWjCuEpnzmbbNt/DLfD2NoURtROARl1sR/F3p+QU=
X-Received: by 2002:a05:6808:2029:b0:3a9:e85d:b689 with SMTP id
 q41-20020a056808202900b003a9e85db689mr16893352oiw.0.1696339767998; Tue, 03
 Oct 2023 06:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com> <20230927-pcc_defines-v2-1-0b8ffeaef2e5@arm.com>
In-Reply-To: <20230927-pcc_defines-v2-1-0b8ffeaef2e5@arm.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 3 Oct 2023 15:29:16 +0200
Message-ID: <CAJZ5v0hG0sDJ4VOY+Gk0Fg1gebNft+z3YK9Jf-7NHb9Ow-C2mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ACPI: PCC: Add PCC shared memory region command
 and status bitfields
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 27, 2023 at 6:32 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Define the common macros to use when referring to various bitfields in
> the PCC generic communications channel command and status fields.
>
> Currently different drivers that need to use these bitfields have defined
> these locally. This common macro is intended to consolidate and replace
> those.
>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  include/acpi/pcc.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
> index 73e806fe7ce7..021891a7434f 100644
> --- a/include/acpi/pcc.h
> +++ b/include/acpi/pcc.h
> @@ -18,7 +18,20 @@ struct pcc_mbox_chan {
>         u16 min_turnaround_time;
>  };
>
> +/* Generic Communications Channel Shared Memory Region */
> +#define PCC_SIGNATURE                  0x50424300
> +/* Generic Communications Channel Command Field */
> +#define PCC_CMD_GENERATE_DB_INTR       BIT(15)
> +/* Generic Communications Channel Status Field */
> +#define PCC_STATUS_CMD_COMPLETE                BIT(0)
> +#define PCC_STATUS_SCI_DOORBELL                BIT(1)
> +#define PCC_STATUS_ERROR               BIT(2)
> +#define PCC_STATUS_PLATFORM_NOTIFY     BIT(3)
> +/* Initiator Responder Communications Channel Flags */
> +#define PCC_CMD_COMPLETION_NOTIFY      BIT(0)
> +
>  #define MAX_PCC_SUBSPACES      256
> +
>  #ifdef CONFIG_PCC
>  extern struct pcc_mbox_chan *
>  pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id);
>
> --

Do you want me to pick up this lot?
