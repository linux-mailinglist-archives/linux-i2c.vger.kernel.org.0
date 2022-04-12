Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2025D4FDAF4
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 12:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiDLIN3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 04:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353802AbiDLHQJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 03:16:09 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7E04133F
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 23:57:30 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id l21so12135475vsm.1
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qgnZcpBIVw/20jUOhWmEfTuzXQZyJ+1bcARldVvAaR8=;
        b=X5P51EVfPZjlbksZyO8vAa5jI/Zmu0YnhLWRiZSjuxLtdc/pjrnDR2w0YrNKPH+cYI
         fyWBt1ei0QdsjfOLU4EOZPj0JZY4HQUPf5PKZEvdUM9d2qfY3pb+jOK2vFsVHNBeKFof
         H+aGU2m1QTsI60XYNtY9YDdRy596GSkEsYoYz3t4GknmiZeZ5BwyGm4SmdQYdT7yRmHs
         vFxqbKONBi5e5dw9d+vRLJBI21c8uRvNoujF3IuGz83SpOggyv2GstoR4RaU1pC8WaSq
         jlmsB9tIzEMSmDCjOjZMTiZjSCjinQi8358aY8SDxoSr23xR2E831/yFOna4ixh/ynUM
         P86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qgnZcpBIVw/20jUOhWmEfTuzXQZyJ+1bcARldVvAaR8=;
        b=kXex0Cup0+NBDc8aP7DMhfCo1HCEEzBjqzw3HrwWLamECyiD5tHZCk4QCoajXBHLd4
         pM7Kler0w20sz47VFsC+fAwCvhwAZPFr0sVsq/Xq7GqiqChBiLtD8aK/0OPWbFE26U/7
         oL/vKiotvuYnngv2FqTv5XxC+AWKxyaAOr3yNAI+Zyw6VgVBADyWXY65DPrAiYg908U6
         wyXXBq06008Sfr45OTMMxzbhMIXdEROZSttCO6BRBm3mMkc17M6s7FazqIX6syIm5zOV
         G1+s+1gV8ZOL8YGNvh2861kLRsVSiXtmKdPSJy5R07PM3yKHv9wJeieQgO3GjdaCA0W7
         sw8w==
X-Gm-Message-State: AOAM533swHNV2+7GzN9wt4/1rHrD7WFSRpGr8NpHLPFNYch0xOkzpm3c
        XLgaf4pn3Qe9E1QPmYZrI8Rj93AuGT3RwiE24MW1AA==
X-Google-Smtp-Source: ABdhPJzxZ0VVLhQigdhqHW6xTC41Uj5hvZ0KEw/IZ7uR6XRK3pIOiIWoZvfuPQfTUR2BGgYZOOC2fTl7spYQoc7habo=
X-Received: by 2002:a05:6102:100c:b0:328:1794:ac99 with SMTP id
 q12-20020a056102100c00b003281794ac99mr6690714vsp.69.1649746649144; Mon, 11
 Apr 2022 23:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220401002200.27584-1-suichen@google.com> <20220401002200.27584-2-suichen@google.com>
 <CAKKbWA4cuv3mPF9Es-TzV-OtbQuLDJdZNU=uOfZXMYaWD-FWCg@mail.gmail.com>
In-Reply-To: <CAKKbWA4cuv3mPF9Es-TzV-OtbQuLDJdZNU=uOfZXMYaWD-FWCg@mail.gmail.com>
From:   Sui Chen <suichen@google.com>
Date:   Mon, 11 Apr 2022 23:57:18 -0700
Message-ID: <CAJOps0uyo0z7EdBweV4gXUCb6fE-23ayEgce1B3h9KWRQpYwcA@mail.gmail.com>
Subject: Re: [RFC Patch v4 1/1] i2c debug counters as sysfs attributes
To:     Avi Fishman <avifishman70@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Tali Perry <tali.perry1@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Josh Lehan <krellan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Avi,

I recently installed a patched kernel on a real machine and am trying
to validate the counters a bit; I would like to find out how the
counters in the i2c core relate to the counters in the npcm7xx driver,
and also explore the possibility of per-address counters, then update
to this list and the linux-kernel list when the results are clear.

And also I need to find a better place to create the sysfs folders
than from within i2c_transfer and i2c_recover_bus.

Thanks,
Sui


On Sun, Apr 3, 2022 at 5:12 AM Avi Fishman <avifishman70@gmail.com> wrote:
>
> Hi Sui,
>
> Do you intend later to push it also to kernel.org?
>
> Avi
>
> On Fri, Apr 1, 2022 at 3:28 AM Sui Chen <suichen@google.com> wrote:
> >
> > This change renames the I2C debug counters as suggested, and moves their
> > processing into the i2c core:
> > - bus_errors
> > - transfers
> > - nacks
> > - recovery_successes
> > - recovery_failures
> > - timeouts
> >
> > The function i2c_adapter_create_stats_folder creates a stats directory
> > in the device's sysfs directory to hold the above debug counters.
> >
> > Did some brief tests with a few test programs that saves/replays I2C
> > trace by reading hwmon sensors. The test program and hardware run in
> > QEMU. The test programs are located at
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/52527
> >
> > (A normal read)
> >
> > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > 264
> > root@gsj:/tmp# ./i2c_bmk_bmc  0
> > idx=0
> > Processing 1 inputs
> > /sys/class/hwmon/hwmon0/temp1_input
> > (../../devices/platform/ahb/ahb:apb/f0081000.i2c/i2c-1/1-005c/hwmon/hwmon0):
> > 0
> > [FindTraceEntries] t0=391.000000 t1=393.000000
> > Found 4 interesting I2C trace entries:
> >  i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
> >  i2c_read: i2c-1 #1 a=05c f=0001 l=2
> >  i2c_reply: i2c-1 #1 a=05c f=0001 l=2 [00-00]
> >  i2c_result: i2c-1 n=2 ret=2
> > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > 265
> >
> > (Read from an inexistent address, NACK)
> >
> > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
> > 6
> > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > 265
> >
> > root@gsj:/tmp# cat i2c_trace.txt
> >  i2c_write: i2c-1 #0 a=0ff f=0000 l=1 [00]
> >  i2c_read: i2c-1 #1 a=0ff f=0001 l=2
> > root@gsj:/tmp# ./i2c_replay_bmc i2c_trace.txt
> > (program runs and completes)
> >
> > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
> > 12
> > root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> > 265
> >
> > The program makes 2 attempts, performing 3 I2C operations at each
> > attempt, which translates to the 6 nack events.
> >
> > Signed-off-by: Sui Chen <suichen@google.com>
> > ---
> >  drivers/i2c/i2c-core-base.c | 32 ++++++++++++-
> >  drivers/i2c/i2c-dev.c       | 94 +++++++++++++++++++++++++++++++++++++
> >  include/linux/i2c.h         | 26 ++++++++++
> >  3 files changed, 151 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 84f12bf90644..53688b1d855a 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -270,11 +270,22 @@ EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
> >
> >  int i2c_recover_bus(struct i2c_adapter *adap)
> >  {
> > +
> > +       if (adap->stats == NULL)
> > +               i2c_adapter_create_stats_directory(adap);
> > +
> >         if (!adap->bus_recovery_info)
> >                 return -EBUSY;
> >
> >         dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
> > -       return adap->bus_recovery_info->recover_bus(adap);
> > +       int ret = adap->bus_recovery_info->recover_bus(adap);
> > +
> > +       if (ret == 0)
> > +               ++(adap->stats->recovery_successes);
> > +       else
> > +               ++(adap->stats->recovery_failures);
> > +
> > +       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(i2c_recover_bus);
> >
> > @@ -2223,6 +2234,23 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> >                 trace_i2c_result(adap, num, ret);
> >         }
> >
> > +       if (adap->stats == NULL) {
> > +               i2c_adapter_create_stats_directory(adap);
> > +       }
> > +
> > +       if (ret < 0) {
> > +               if (ret == -ENXIO)
> > +                       ++(adap->stats->nacks);
> > +               else if (ret == -ETIMEDOUT)
> > +                       ++(adap->stats->timeouts);
> > +               else
> > +                       ++(adap->stats->bus_errors);
> > +       }
> > +
> > +       if (ret == num) {
> > +               ++(adap->stats->transfers);
> > +       }
> > +
> >         return ret;
> >  }
> >  EXPORT_SYMBOL(__i2c_transfer);
> > @@ -2485,6 +2513,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
> >         }
> >
> >         kfree(temp_client);
> > +       i2c_adapter_create_stats_directory(adapter);
> >         return err;
> >  }
> >
> > @@ -2617,6 +2646,7 @@ void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred)
> >
> >         kfree(buf);
> >  }
> > +
> >  EXPORT_SYMBOL_GPL(i2c_put_dma_safe_msg_buf);
> >
> >  MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
> > diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> > index 77f576e51652..253622706b63 100644
> > --- a/drivers/i2c/i2c-dev.c
> > +++ b/drivers/i2c/i2c-dev.c
> > @@ -767,6 +767,100 @@ static void __exit i2c_dev_exit(void)
> >         unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
> >  }
> >
> > +static struct i2c_adapter *kobj_to_adapter(struct device *pdev)
> > +{
> > +       struct kobject *dev_kobj;
> > +       struct device *dev;
> > +
> > +       dev_kobj = ((struct kobject *)pdev)->parent;
> > +       dev = container_of(dev_kobj, struct device, kobj);
> > +       return to_i2c_adapter(dev);
> > +}
> > +
> > +ssize_t bus_errors_show(struct device *pdev,
> > +                       struct device_attribute *attr, char *buf)
> > +{
> > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->bus_errors);
> > +}
> > +DEVICE_ATTR_RO(bus_errors);
> > +
> > +ssize_t transfers_show(struct device *pdev,
> > +                            struct device_attribute *attr, char *buf)
> > +{
> > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->transfers);
> > +}
> > +DEVICE_ATTR_RO(transfers);
> > +
> > +ssize_t nacks_show(struct device *pdev,
> > +                  struct device_attribute *attr, char *buf)
> > +{
> > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->nacks);
> > +}
> > +DEVICE_ATTR_RO(nacks);
> > +
> > +ssize_t recovery_successes_show(struct device *pdev,
> > +                               struct device_attribute *attr, char *buf)
> > +{
> > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_successes);
> > +}
> > +DEVICE_ATTR_RO(recovery_successes);
> > +
> > +ssize_t recovery_failures_show(struct device *pdev,
> > +                              struct device_attribute *attr, char *buf)
> > +{
> > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_failures);
> > +}
> > +DEVICE_ATTR_RO(recovery_failures);
> > +
> > +ssize_t timeouts_show(struct device *pdev,
> > +                     struct device_attribute *attr, char *buf)
> > +{
> > +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->timeouts);
> > +}
> > +DEVICE_ATTR_RO(timeouts);
> > +
> > +/**
> > + * i2c_adapter_create_stats_directory - creates folder for I2C statistics.
> > + * @adapter: the i2c_adapter to create the stats directory for.
> > + *
> > + * Return: 0 if successful, 1 if failed.
> > + */
> > +int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter)
> > +{
> > +       struct i2c_adapter_stats *stats;
> > +       int ret = 1;
> > +
> > +       stats = kzalloc(sizeof(*stats), GFP_KERNEL);
> > +       if (!stats) {
> > +               adapter->stats = NULL;
> > +               return ret;
> > +       }
> > +       adapter->stats = stats;
> > +       adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);
> > +
> > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_transfers.attr);
> > +       if (ret)
> > +               dev_warn(&adapter->dev, "Failed to create sysfs file for tx_complete_cnt\n");
> > +
> > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_bus_errors.attr);
> > +       if (ret)
> > +               dev_warn(&adapter->dev, "Failed to create sysfs file for bus_errors\n");
> > +
> > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nacks.attr);
> > +       if (ret)
> > +               dev_warn(&adapter->dev, "Failed to create sysfs file for nacks\n");
> > +
> > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_successes.attr);
> > +       if (ret)
> > +               dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_successes\n");
> > +
> > +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_failures.attr);
> > +       if (ret)
> > +               dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_failures\n");
> > +
> > +       return ret;
> > +}
> > +
> >  MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
> >  MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
> >  MODULE_DESCRIPTION("I2C /dev entries driver");
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index 3eb60a2e9e61..c8608378da2a 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -21,6 +21,7 @@
> >  #include <linux/of.h>          /* for struct device_node */
> >  #include <linux/swab.h>                /* for swab16 */
> >  #include <uapi/linux/i2c.h>
> > +#include <linux/slab.h> /* for kzalloc */
> >
> >  extern struct bus_type i2c_bus_type;
> >  extern struct device_type i2c_adapter_type;
> > @@ -684,6 +685,25 @@ struct i2c_adapter_quirks {
> >         u16 max_comb_2nd_msg_len;
> >  };
> >
> > +/**
> > + * I2C statistics
> > + * The list of statistics are currently copied from npcm7xx.
> > + * Perhaps a more universal set of statistics can be used.
> > + *
> > + * The stats are currently modeled as pointers to members in the bus drivers.
> > + * A null pointer indicates the counter is not supported by the bus driver.
> > + */
> > +struct i2c_adapter_stats {
> > +       struct kobject *kobj;
> > +
> > +       u64 transfers;
> > +       u64 bus_errors;
> > +       u64 nacks;
> > +       u64 recovery_successes;
> > +       u64 recovery_failures;
> > +       u64 timeouts;
> > +};
> > +
> >  /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
> >  #define I2C_AQ_COMB                    BIT(0)
> >  /* first combined message must be write */
> > @@ -735,12 +755,18 @@ struct i2c_adapter {
> >
> >         struct i2c_bus_recovery_info *bus_recovery_info;
> >         const struct i2c_adapter_quirks *quirks;
> > +       struct i2c_adapter_stats *stats;
> >
> >         struct irq_domain *host_notify_domain;
> >         struct regulator *bus_regulator;
> >  };
> >  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
> >
> > +int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter);
> > +
> > +void i2c_adapter_stats_register_counter(struct i2c_adapter *adapter,
> > +                                       const char *counter_name, void *data_source);
> > +
> >  static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
> >  {
> >         return dev_get_drvdata(&adap->dev);
> > --
> > 2.35.1.1094.g7c7d902a7c-goog
> >
>
>
> --
> Regards,
> Avi
