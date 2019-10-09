Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2302D1CC6
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 01:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbfJIXX5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Oct 2019 19:23:57 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35848 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730955AbfJIXX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Oct 2019 19:23:57 -0400
Received: by mail-oi1-f194.google.com with SMTP id k20so3293304oih.3;
        Wed, 09 Oct 2019 16:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6G6j5//triwk3xD4Q2NO67sGsuWBX7fz1Q5CDaTM4oo=;
        b=WNoC9+KsSCJYS2KgGc2jzWBe73iViV8sYRRbe7cg75H20IwX7qL0R4Q7IYTUloW5k1
         uulTn+G9NELagbi4YMXLZ/cBNfbV0MZQLceeRuuVHqbb3ViQNTsgue9B1NeLe21AtqmE
         ST3U88qZfc+QK14YB6g3jQiGAMh4Ruc51XuFtk3BlH5TkIv+fTIxK8TblbjNUdQ0ZBha
         pB2Evwk8jbFQ/3J6dH6xz7tsbYyQ0awmEMpdDfCaCsuqQaDe8VXSQk1a0aavlckoTYcW
         PDSMj9E4/5I7/KfLCEVuAU4Dfr+aez3xnVHwRRkiJ6HH4sd0MB8HSFQkviC5ulVqMwur
         SluQ==
X-Gm-Message-State: APjAAAVy/fZSogawWggmZNZo3w6jsmFdnl9p6fEZUyWdeYB9RzdnkDps
        Ru78QAr7Ew7tRNYGJ5pymg==
X-Google-Smtp-Source: APXvYqzJgTJPPbbxfeee2bJmvNaVr5twY5I/E/7qtdmrMr6fzT/hlgG9VuCoZMM/C4r9LgJd08JaDQ==
X-Received: by 2002:aca:5bd5:: with SMTP id p204mr4759058oib.61.1570663435881;
        Wed, 09 Oct 2019 16:23:55 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l12sm962125oii.48.2019.10.09.16.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 16:23:55 -0700 (PDT)
Date:   Wed, 9 Oct 2019 18:23:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Mark Rutland <mark.rutland@arm.com>, Peter Rosin <peda@axentia.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: at24: convert the binding document
 to yaml
Message-ID: <20191009232354.GA23030@bogus>
References: <20191002072047.20895-1-brgl@bgdev.pl>
 <20191002072047.20895-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002072047.20895-2-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed,  2 Oct 2019 09:20:46 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Convert the binding document for at24 EEPROMs from txt to yaml. The
> compatible property uses a regex pattern to address all the possible
> combinations of "vendor,model" strings.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> [robh: rework compatible schema, fix missing allOf for $ref, fix errors in example]
> Signed-off-by: Rob Herring <robh@kernel.org>
> [Bartosz: added comments explaining the compatible property]
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../devicetree/bindings/eeprom/at24.txt       |  90 +--------
>  .../devicetree/bindings/eeprom/at24.yaml      | 185 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 187 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/eeprom/at24.yaml
> 

Applied, thanks.

Rob
