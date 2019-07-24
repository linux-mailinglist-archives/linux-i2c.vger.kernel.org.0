Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2D1472B9E
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 11:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfGXJnZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 05:43:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:40944 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727025AbfGXJnY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jul 2019 05:43:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 067A0AFE4;
        Wed, 24 Jul 2019 09:43:20 +0000 (UTC)
Date:   Wed, 24 Jul 2019 11:43:18 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Cooks <acooks@rationali.st>, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [RESEND][PATCH v4 2/3] i2c: piix4: fix probing of reserved
 ports on AMD
Message-ID: <20190724114318.5f826dd3@endymion>
In-Reply-To: <970f151329b43cfa5f842dc0fe0604b03c5c1297.1519601860.git.andrew.cooks@opengear.com>
References: <cover.1519601860.git.andrew.cooks@opengear.com>
        <970f151329b43cfa5f842dc0fe0604b03c5c1297.1519601860.git.andrew.cooks@opengear.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 26 Feb 2018 10:28:44 +1000, Andrew Cooks wrote:
> Prevent bus timeouts and resets on Family 16h Model 30h by not probing
> reserved Ports 3 and 4.
> 
> According to the AMD BIOS and Kernel Developer's Guides (BKDG), Port 3
> and Port 4 are reserved on the following devices:
>  - Family 15h Model 60h-6Fh
>  - Family 15h Model 70h-7Fh
>  - Family 16h Model 30h-3Fh
> 
> Signed-off-by: Andrew Cooks <andrew.cooks@opengear.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)

I agree the change is needed but I'm not convinced about the
implementation. It seems more complex than it needs to be and not
reliable is something goes wrong.

> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 5c90a44..01f1610 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -80,7 +80,8 @@
>  #define PIIX4_BLOCK_DATA	0x14
>  
>  /* Multi-port constants */
> -#define PIIX4_MAX_ADAPTERS 4
> +#define PIIX4_MAX_ADAPTERS	4
> +#define HUDSON2_MAIN_PORTS	2 /* HUDSON2, KERNCZ reserves ports 3, 4 */
>  
>  /* SB800 constants */
>  #define SB800_PIIX4_SMB_IDX		0xcd6
> @@ -800,6 +801,7 @@ MODULE_DEVICE_TABLE (pci, piix4_ids);
>  
>  static struct i2c_adapter *piix4_main_adapters[PIIX4_MAX_ADAPTERS];
>  static struct i2c_adapter *piix4_aux_adapter;
> +static int piix4_adapter_count;
>  
>  static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  			     bool sb800_main, u8 port, bool notify_imc,
> @@ -849,6 +851,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  	}
>  
>  	*padap = adap;
> +	piix4_adapter_count++;
>  	return 0;
>  }

So piix4_adapter_count is counting the *overall* number of
*successfully* created adapters. This count could be *more* than
PIIX4_MAX_ADAPTERS/HUDSON2_MAIN_PORTS (if all main adapters plus the
aux adapter are created successfully). But this count could also be
*less* than PIIX4_MAX_ADAPTERS (on all systems where ports 3 and 4 are
reserved and thus now skipped).

>  
> @@ -856,10 +859,17 @@ static int piix4_add_adapters_sb800(struct pci_dev *dev, unsigned short smba,
>  				    bool notify_imc)
>  {
>  	struct i2c_piix4_adapdata *adapdata;
> -	int port;
> +	int port, port_count;
>  	int retval;
>  
> -	for (port = 0; port < PIIX4_MAX_ADAPTERS; port++) {
> +	if (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
> +	    dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS) {

(There's another potential problem here, see below.)

> +		port_count = HUDSON2_MAIN_PORTS;
> +	} else {
> +		port_count = PIIX4_MAX_ADAPTERS;
> +	}
> +

Here port_count represents the number of *possible* *main* adapter
ports. So not the same as piix4_adapter_count.

> +	for (port = 0; port < port_count; port++) {
>  		retval = piix4_add_adapter(dev, smba, true, port, notify_imc,
>  					   piix4_main_port_names_sb800[port],
>  					   &piix4_main_adapters[port]);
> @@ -889,6 +899,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	int retval;
>  	bool is_sb800 = false;
> +	piix4_adapter_count = 0;
>  
>  	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
>  	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
> @@ -993,7 +1004,7 @@ static void piix4_adap_remove(struct i2c_adapter *adap)
>  
>  static void piix4_remove(struct pci_dev *dev)
>  {
> -	int port = PIIX4_MAX_ADAPTERS;
> +	int port = piix4_adapter_count;

And here we have the problem. We are basically looping over
piix4_main_adapters[] which has exactly PIIX4_MAX_ADAPTERS elements,
some of which may be unused. If piix4_adapter_count is 5 (4 main + 1
aux port) we will overrun the array. And if one "middle" main adapter
port failed to register (unlikely event but can happen in theory, for
example on memory allocation error) then we may omit to unregister the
last main adapter.

What we really need here is port_count from function
piix4_add_adapters_sb800(), which unfortunately was a local and no
longer exists.

>  
>  	while (--port >= 0) {
>  		if (piix4_main_adapters[port]) {

I think the whole change can be simplified by introducing only 1 new
variable instead of 2, and using it where appropriate:

--- linux-5.1.orig/drivers/i2c/busses/i2c-piix4.c	2019-07-24 10:02:40.404816668 +0200
+++ linux-5.1/drivers/i2c/busses/i2c-piix4.c	2019-07-24 11:22:47.827417870 +0200
@@ -80,7 +80,8 @@
 #define PIIX4_BLOCK_DATA	0x14
 
 /* Multi-port constants */
-#define PIIX4_MAX_ADAPTERS 4
+#define PIIX4_MAX_ADAPTERS	4
+#define HUDSON2_MAIN_PORTS	2 /* HUDSON2, KERNCZ reserves ports 3, 4 */
 
 /* SB800 constants */
 #define SB800_PIIX4_SMB_IDX		0xcd6
@@ -814,6 +815,7 @@ MODULE_DEVICE_TABLE (pci, piix4_ids);
 
 static struct i2c_adapter *piix4_main_adapters[PIIX4_MAX_ADAPTERS];
 static struct i2c_adapter *piix4_aux_adapter;
+static int piix4_adapter_count;
 
 static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 			     bool sb800_main, u8 port, bool notify_imc,
@@ -873,7 +875,14 @@ static int piix4_add_adapters_sb800(stru
 	int port;
 	int retval;
 
-	for (port = 0; port < PIIX4_MAX_ADAPTERS; port++) {
+	if (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
+	    dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS) {
+		piix4_adapter_count = HUDSON2_MAIN_PORTS;
+	} else {
+		piix4_adapter_count = PIIX4_MAX_ADAPTERS;
+	}
+
+	for (port = 0; port < piix4_adapter_count; port++) {
 		retval = piix4_add_adapter(dev, smba, true, port, notify_imc,
 					   piix4_main_port_names_sb800[port],
 					   &piix4_main_adapters[port]);
@@ -995,7 +1005,7 @@ static void piix4_adap_remove(struct i2c
 
 static void piix4_remove(struct pci_dev *dev)
 {
-	int port = PIIX4_MAX_ADAPTERS;
+	int port = piix4_adapter_count;
 
 	while (--port >= 0) {
 		if (piix4_main_adapters[port]) {

Anyone sees a problem with this approach?

The second issue I see is that ports 3 and 4 are skipped for all
PCI_DEVICE_ID_AMD_HUDSON2_SMBUS devices while the previous patch in
this series suggests that the Bolton chipset (device revision 0x15)
behaves differently. As a matter of fact the description of this patch
does not list it as being affected by the issue. So in effect we would
be disabling ports 3 and 4 for Bolton users, who may have valuable I2C
devices connected there. We just fixed a regression for them with
previous patch, let's not introduce a new one with this patch. I think
the device test should look like:

	if (PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS ||
	    (PIIX4_dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS &&
	     PIIX4_dev->revision >= 0x1F)) {
		piix4_adapter_count = HUDSON2_MAIN_PORTS;
	} else {
		(...)

i.e. the same as in previous patch.

By the way, I don't own compatible hardware. I will see if I can gain
access to a SUSE Labs machine for testing purposes, but it would be a
lot easier if someone with the hardware could test the patch series
once it is rebased. Volunteers?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
